import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/apis/destination.api.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/screens/destination_detail/destination_screen.dart';
import 'package:travel_app/widgets/destinations/destination_line/destination_line.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DestinationAllList extends ConsumerStatefulWidget {
  const DestinationAllList({Key? key}) : super(key: key);

  @override
  DestinationAllListState createState() => DestinationAllListState();
}

class DestinationAllListState extends ConsumerState<DestinationAllList> {
  List<Destination>? destinations = [];

  Future<void> _fetchData() async {
    String? accessToken = await ref.watch(authProvider).getCurrentAccessToken();
    List<Destination>? data = await DestinationApi().getAllDestinations(
      accessToken!,
    );
    if (data == null) {
      // Unauthoriezed, access token expired
      String? newAccessToken = await ref.watch(authProvider).regenerateToken();
      List<Destination>? newData = await DestinationApi().getAllDestinations(
        newAccessToken!,
      );
      setState(() {
        destinations = newData;
      });
    }
    setState(() {
      destinations = data;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _fetchData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              AppLocalizations.of(context)!.allDestination,
              style: const TextStyle(fontFamily: 'VNPro', fontSize: 22.5),
            ),
            const SizedBox(width: 7.5),
            const Icon(
              Icons.travel_explore_sharp,
              size: 30.0,
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SafeArea(
        child: destinations == null || destinations!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.lightBlue,
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                itemCount: destinations?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: DestinationLine(destination: destinations![index]),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(
                            destination: destinations![index],
                          ),
                        ),
                      ),
                    },
                  );
                },
              ),
      ),
    );
  }
}

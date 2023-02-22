import 'package:flutter/material.dart';
import 'package:travel_app/apis/destination.api.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/screens/destination_detail/destination_screen.dart';
import 'package:travel_app/widgets/destinations/destination_line/destination_line.dart';

class DestinationAllList extends StatefulWidget {
  const DestinationAllList({Key? key}) : super(key: key);

  @override
  DestinationAllListState createState() => DestinationAllListState();
}

class DestinationAllListState extends State<DestinationAllList> {
  List<Destination>? destinations = [];

  Future<void> _fetchData() async {
    List<Destination>? data = await DestinationApi.getAllDestinations();
    setState(() {
      destinations = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              "All Destinations",
              style: TextStyle(
                fontFamily: 'Mukta',
                fontSize: 25.0,
              ),
            ),
            SizedBox(width: 7.5),
            Icon(
              Icons.travel_explore_sharp,
              size: 30.0,
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SafeArea(
        child: ListView.builder(
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

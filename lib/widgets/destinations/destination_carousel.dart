import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/screens/destination_detail/destination_screen.dart';
import 'package:travel_app/widgets/destinations/destination_card/destination_card.dart';
import 'package:travel_app/widgets/destinations/destination_header.dart';
import '../../apis/destination.api.dart';

class DestinationCarousel extends ConsumerStatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  DestinationCarouselState createState() => DestinationCarouselState();
}

class DestinationCarouselState extends ConsumerState<DestinationCarousel> {
  List<Destination>? destinations = [];

  Future<void> _fetchData() async {
    String? accessToken = await ref.watch(authProvider).getCurrentAccessToken();
    List<Destination>? data = await DestinationApi().getTopDestinations(
      accessToken!,
    );
    if (data == null) {
      // Unauthorized
      String? newAccessToken = await ref.watch(authProvider).regenerateToken();
      List<Destination>? newData = await DestinationApi().getTopDestinations(
        newAccessToken!,
      );
      setState(() {
        destinations = newData;
      });
    } else {
      setState(() {
        destinations = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _fetchData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: DestinationHeader(),
        ),
        SizedBox(
          height: 330.0,
          child: destinations == null || destinations!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.lightBlue),
                )
              : CarouselSlider.builder(
                  itemCount: destinations?.length,
                  itemBuilder: (BuildContext context, int index, int realIdx) {
                    Destination destination = destinations![index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(
                            destination: destination,
                          ),
                        ),
                      ),
                      child: DestinationCard(destination: destination),
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 1.2,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    viewportFraction: 0.6,
                    enableInfiniteScroll: true,
                  ),
                ),
        ),
      ],
    );
  }
}

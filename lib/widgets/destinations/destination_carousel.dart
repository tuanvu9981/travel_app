import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/screens/destination_detail/destination_screen.dart';
import 'package:travel_app/widgets/destinations/destination_card/destination_card.dart';
import 'package:travel_app/widgets/destinations/destination_header.dart';
import '../../apis/destination.api.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  DestinationCarouselState createState() => DestinationCarouselState();
}

class DestinationCarouselState extends State<DestinationCarousel> {
  List<Destination>? destinations = [];

  Future<void> _fetchData() async {
    List<Destination>? data = await DestinationApi.getTopDestinations();
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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: DestinationHeader(),
        ),
        SizedBox(
          height: 330.0,
          child: destinations == null || destinations?.length == 0
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

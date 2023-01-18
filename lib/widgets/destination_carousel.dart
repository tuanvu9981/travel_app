import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/screens/destination_screen.dart';
import 'package:travel_app/widgets/destinations/destination_card/destination_card.dart';
import 'package:travel_app/widgets/destinations/destination_header.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // right + left
          child: DestinationHeader(),
        ),
        SizedBox(
          height: 285.0,
          // color: Colors.blue,
          child: CarouselSlider.builder(
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index, int realIdx) {
              Destination destination = destinations[index];
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
              aspectRatio: 1.25,
              enlargeCenterPage: true,
              autoPlay: false,
              viewportFraction: 0.65,
              enableInfiniteScroll: true,
            ),
          ),
        ),
      ],
    );
  }
}

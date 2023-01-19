import 'package:flutter/material.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/widgets/destinations/destination_card/description_white_box.dart';
import 'package:travel_app/widgets/destinations/destination_card/destination_image.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;
  DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 20.0),
      width: 210.0,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          DescriptionWhiteBox(
            length: destination.activities!.length,
            description: destination.description ?? "",
          ),
          DestinationImage(
            imageUrl: destination.imageUrl ?? "",
            city: destination.city ?? "",
            country: destination.country ?? "",
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationImage extends StatelessWidget {
  final String imageUrl;
  final String city;
  final String country;

  DestinationImage({
    required this.imageUrl,
    required this.city,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Image(
                // height: 100.0, width: 100.0, iphone 11
                image: AssetImage(imageUrl),
                height: 140.0,
                width: 210.0, //same as width of white box
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            // SERIOUSLY BE WARED OF THIS !
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationArrow,
                      size: 10.0,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      country,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

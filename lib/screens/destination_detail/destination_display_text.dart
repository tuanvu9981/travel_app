import 'package:flutter/material.dart';

class DestinationDisplayText extends StatelessWidget {
  String? city;
  String? country;
  DestinationDisplayText({Key? key, this.city, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.connecting_airports_outlined,
              size: 16.0,
              color: Colors.white,
            ),
            const SizedBox(width: 5.0),
            Text(
              country ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LocationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 20.0,
      bottom: 20.0,
      child: Icon(
        Icons.location_on,
        size: 25.0,
        color: Colors.white,
      ),
    );
  }
}

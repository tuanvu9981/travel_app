import 'package:flutter/material.dart';

class DestinationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Top Destinations",
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => {},
          child: Text(
            "See all",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              // Theme's color is NOT CONSTANT --> ALWAYS CHANGES
              fontSize: 18.5,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

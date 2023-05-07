import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class DestinationHeader extends StatelessWidget {
  const DestinationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Routemaster.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Top Destinations",
          style: TextStyle(
            fontSize: 18.5,
            fontFamily: 'VNPro',
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => {
            navigator.replace('/all-destination'),
          },
          child: Text(
            "See all",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              // Theme's color is NOT CONSTANT --> ALWAYS CHANGES
              fontSize: 16.5,
              fontFamily: 'VNPro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

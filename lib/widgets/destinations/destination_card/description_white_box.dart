import 'package:flutter/material.dart';

class DescriptionWhiteBox extends StatelessWidget {
  final int length;
  final String description;

  DescriptionWhiteBox({required this.length, required this.description});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12.5,
      child: Container(
        height: 170.0,
        width: 230.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$length activities',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2.5),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

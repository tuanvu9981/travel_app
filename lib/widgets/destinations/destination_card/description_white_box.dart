import 'package:flutter/material.dart';

class DescriptionWhiteBox extends StatelessWidget {
  final int length;
  final String description;

  DescriptionWhiteBox({required this.length, required this.description});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110.0, // bottom: 10.0,
      child: Container(
        height: 120.0,
        width: 210.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$length activities',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5.0),
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

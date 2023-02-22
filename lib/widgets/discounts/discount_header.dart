import 'package:flutter/material.dart';

class DiscountHeader extends StatelessWidget {
  const DiscountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Latest discounts & Information",
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

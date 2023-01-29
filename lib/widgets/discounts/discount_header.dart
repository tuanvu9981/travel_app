import 'package:flutter/material.dart';

class DiscountHeader extends StatelessWidget {
  const DiscountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Discounts & Information",
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

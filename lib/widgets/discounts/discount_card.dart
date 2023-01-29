import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  String? imgUrl;
  String? title;

  DiscountCard({
    Key? key,
    this.imgUrl,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: NetworkImage(imgUrl!),
          // height and weight here NO USE ????
          height: 35.0,
          width: 250.0,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 12.5,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

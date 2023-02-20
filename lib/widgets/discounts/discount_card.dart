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
          height: 100.0,
          width: 250.0,
          fit: BoxFit.cover,
        ),
        Container(
          height: 50.0,
          width: 250.0,
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.5),
              bottomRight: Radius.circular(12.5),
            ),
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

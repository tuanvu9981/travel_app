import 'package:flutter/material.dart';
import 'package:travel_app/models/discount.model.dart';

class DiscountInfoDetail extends StatelessWidget {
  final DiscountInfo discountInfo;
  const DiscountInfoDetail({
    required this.discountInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Image(
            image: NetworkImage(discountInfo.imageUrl!),
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.4,
          ),
        ],
      ),
    );
  }
}

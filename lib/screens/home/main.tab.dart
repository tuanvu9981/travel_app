import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/widgets/destinations/destination_carousel.dart';
import 'package:travel_app/widgets/discounts/discount_carousel.dart';

class MainTab extends ConsumerWidget {
  final _sloganStyle = TextStyle(fontSize: 30.0, fontFamily: 'DancingScript');

  MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Let's explore the world", style: _sloganStyle),
              Container(
                margin: const EdgeInsets.only(left: 170.0),
                child: Row(
                  children: [
                    Text("with us !", style: _sloganStyle),
                    const SizedBox(width: 7.5),
                    const Icon(
                      Icons.travel_explore_sharp,
                      size: 30.0,
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5.0),
        const DiscountCarousel(),
        const SizedBox(height: 5.0),
        const DestinationCarousel(),
      ],
    );
  }
}

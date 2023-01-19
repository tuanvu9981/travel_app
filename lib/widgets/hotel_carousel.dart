import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/hotel.model.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // padding of right + left, each 20.0 pixel
          child: Row(
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
                    // Theme's color is NOT CONSTANT --> ALWAYS CHANGES
                    fontSize: 18.5,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120.0,
          width: 650.0,
          // color: Colors.blue,
          child: CarouselSlider.builder(
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index, int realIdx) {
              Hotel hotel = hotels[index];
              return Container(
                margin: const EdgeInsets.all(7.5),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                // color: Colors.red,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.5)),
                  child: Image(
                    image: AssetImage(hotel.imageUrl ?? ""),
                    // height: 100.0,
                    // width: 220.0,
                    // height and weight here NO USE ????
                    height: 35.0,
                    width: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
              // return Text(destination.city ?? "");
            },
            options: CarouselOptions(
              autoPlay: true,
              // enableInfiniteScroll: false, // start again from the first element
              viewportFraction: 0.625,
              autoPlayInterval: const Duration(seconds: 2),
            ),
          ),
        ),
      ],
    );
  }
}

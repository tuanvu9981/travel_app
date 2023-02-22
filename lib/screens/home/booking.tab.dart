import 'package:flutter/material.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({Key? key}) : super(key: key);

  @override
  BookingTabState createState() => BookingTabState();
}

class BookingTabState extends State<BookingTab> {
  final _sloganStyle = TextStyle(fontSize: 30.0, fontFamily: 'DancingScript');

  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Booking Tab Here", style: _sloganStyle),
              // Container(
              //   margin: const EdgeInsets.only(left: 170.0),
              //   child: Row(
              //     children: [
              //       Text("with us !", style: _sloganStyle),
              //       const SizedBox(width: 7.5),
              //       const Icon(
              //         Icons.travel_explore_sharp,
              //         size: 30.0,
              //         color: Colors.lightGreen,
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ],
    );
  }
}

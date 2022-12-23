import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/destination.model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination? destination;
  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width, // height = weight
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ]),
                  child: Hero(
                    tag: widget.destination?.imageUrl ?? "",
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage(
                          widget.destination?.imageUrl ?? "",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.search),
                            iconSize: 30.0,
                            color: Colors.black,
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon: const Icon(FontAwesomeIcons.sortAmountDown),
                            iconSize: 30.0,
                            color: Colors.black,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

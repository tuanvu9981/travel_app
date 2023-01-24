import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/activity.model.dart';
import '../models/destination.model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination? destination;
  DestinationScreen({this.destination});

  @override
  DestinationScreenState createState() => DestinationScreenState();
}

class DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStar(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    // stars.trim()
    return Text(stars);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width *
                      0.9, // height = width * 0.9
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 9.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: widget.destination?.imageUrl ?? "",
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
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
                    vertical: 20.0,
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
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  // SERIOUSLY BE WARED OF THIS !
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination?.city ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 16.0,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            widget.destination?.country ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Icon(
                    Icons.location_on,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // between big image and list view should not render a SizedBox !!!
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination?.activities?.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination!.activities![index];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        height: 180.0,
                        width: double.infinity, // ?????
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.fromLTRB(130.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150.0,
                                    child: Text(
                                      activity.name ?? "",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity.price}',
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      const Text(
                                        'per pax',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.5),
                              Text(
                                activity.type ?? "",
                                style: const TextStyle(
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              _buildRatingStar(activity.rating ?? 0),
                              const SizedBox(height: 12.5),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD8ECF1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    // being center of box(container=div)
                                    child: Text(activity.startTimes![0]),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD8ECF1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    // being center of box(container=div)
                                    child: Text(activity.startTimes![1]),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30.0,
                        top: 20.0,
                        // only left, top: the image still not cover. add both top & bottom
                        bottom: 20.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(activity.imageUrl ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/destination.model.dart';
import 'package:travel_app/models/activity.model.dart';
import 'package:travel_app/widgets/activities/activity_card.dart';
import './destination_image.dart';
import './destination_display_text.dart';
import '../../utils/destination.info.dart';

class DestinationScreen extends StatefulWidget {
  Destination? destination;
  DestinationScreen({Key? key, this.destination}) : super(key: key);

  @override
  DestinationScreenState createState() => DestinationScreenState();
}

class DestinationScreenState extends State<DestinationScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                DestinationImage(imgUrl: widget.destination?.imageUrl ?? ""),
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
                  bottom: 20.0, // SERIOUSLY BE WARED OF THIS !
                  child: DestinationDisplayText(
                    city: widget.destination?.city,
                    country: widget.destination?.country,
                  ),
                ),
                LocationIcon()
              ],
            ),
            // between big image and list view should not render a SizedBox !!!
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination?.activities?.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination!.activities![index];
                  return ActivityCard(activity: activity);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColorLight,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: DestinationInfo()
            .btmNavIcons
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
            .toList(),
      ),
    );
  }
}

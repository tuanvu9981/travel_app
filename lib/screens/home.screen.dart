import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/hotel_carousel.dart';
import '../widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  final int _currentHour = DateTime.now().hour;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color(0xFFD8ECF1)
              : const Color.fromARGB(255, 243, 243, 240),
          // color: const Theme.of(context).accentColor
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            width: 0.5,
            color: Colors.blueGrey.shade100,
          ),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  Widget _buildGreetingByHour(int hour) {
    String greeting = "Welcome, Tuan Vu";
    IconData icons;
    if (hour <= 12 && hour >= 5) {
      greeting = "Good morning, Tuan Vu";
      icons = Icons.wb_sunny;
    } else if ((hour > 12) && (hour <= 17)) {
      greeting = "Good afternoon, Tuan Vu";
      icons = Icons.sunny;
    } else if ((hour > 17) && (hour < 20)) {
      greeting = "Good evening, Tuan Vu";
      icons = Icons.nights_stay;
    } else {
      greeting = "Good night, Tuan Vu";
      icons = Icons.nights_stay;
    }
    return Padding(
      // padding: EdgeInsets.only(left: 20.0, right: 120.0), iphone 11 pro max,
      padding: const EdgeInsets.only(left: 20.0, right: 40.0), // xiaomi
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            greeting,
            style: const TextStyle(
              fontSize: 18.5,
              // fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(width: 15.0),
          Icon(
            icons,
            size: 37.5,
            color: Colors.yellow.shade500,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              _buildGreetingByHour(_currentHour),
              const Padding(
                // padding: EdgeInsets.only(left: 20.0, right: 120.0), iphone 11 pro max,
                padding: EdgeInsets.only(left: 20.0, right: 40.0), // xiaomi
                child: Text(
                  "What would you like to find ?",
                  style: TextStyle(
                    fontSize: 18.5,
                    // fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: _icons
              //       .asMap()
              //       .entries
              //       .map(
              //         (MapEntry map) => _buildIcon(map.key),
              //       )
              //       .toList(),
              // ),
              const SizedBox(height: 20.0),
              DestinationCarousel(),
              const SizedBox(height: 5.0),
              HotelCarousel(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              // title: SizedBox.shrink(),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.cake,
                size: 30.0,
              ),
              label: "Food",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: AssetImage('assets/images/duck.jpg'),
              ),
              label: "Personal",
            ),
          ],
        ));
  }
}

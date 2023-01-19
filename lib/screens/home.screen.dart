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

  Widget _buildAppbarGreetingByHour(int hour) {
    String greeting = "Welcome, Tuan Vu";
    IconData icons;
    if (hour <= 12 && hour >= 5) {
      greeting = "Good morning, Tuan Vu";
      icons = Icons.wb_sunny;
    } else if ((hour > 12) && (hour <= 17)) {
      greeting = "Good afternoon, Tuan Vu";
      icons = Icons.wb_sunny;
    } else if ((hour > 17) && (hour < 20)) {
      greeting = "Good evening, Tuan Vu";
      icons = Icons.nights_stay;
    } else {
      greeting = "Good night, Tuan Vu";
      icons = Icons.nights_stay;
    }
    return Row(
      children: [
        Text(
          greeting,
          style: const TextStyle(fontSize: 18.5),
        ),
        const SizedBox(width: 6.0),
        Icon(
          icons,
          size: 28.5,
          color: Colors.yellow.shade500,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _buildAppbarGreetingByHour(_currentHour),
          backgroundColor: Theme.of(context).primaryColorLight,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, size: 28.5),
              tooltip: 'Notification',
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            children: <Widget>[
              Padding(
                // padding: EdgeInsets.only(left: 20.0, right: 120.0), iphone 11 pro max,
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ), // xiaomi
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let's explore the world",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'DancingScript',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 170.0),
                      child: Row(
                        children: const [
                          Text(
                            "with us !",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'DancingScript',
                            ),
                          ),
                          SizedBox(width: 7.5),
                          Icon(
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
              const SizedBox(height: 10.0),
              DestinationCarousel(),
              const SizedBox(height: 5.0),
              HotelCarousel(),
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history_edu_outlined,
                size: 30.0,
              ),
              label: "Booking",
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

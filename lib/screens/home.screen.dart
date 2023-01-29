import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/discounts/discount_carousel.dart';
import '../widgets/destinations/destination_carousel.dart';
import '../utils/home.info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  final int _currentHour = DateTime.now().hour;
  final TextStyle _sloganStyle =
      const TextStyle(fontSize: 30.0, fontFamily: 'DancingScript');

  Widget _buildAppbarGreetingByHour(int hour) {
    Greeting greeting = HomeInfoUtil().greetingByHour(hour);
    return Row(
      children: [
        Text(
          greeting.text,
          style: const TextStyle(fontSize: 18.5, fontFamily: 'Mukta'),
        ),
        const SizedBox(width: 6.0),
        Icon(
          greeting.icons,
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
            const SizedBox(height: 15.0),
            const DestinationCarousel(),
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
        items: HomeInfoUtil()
            .btmNavIcons
            .map((e) => BottomNavigationBarItem(
                  icon: e.icon,
                  label: e.label,
                ))
            .toList(),
      ),
    );
  }
}

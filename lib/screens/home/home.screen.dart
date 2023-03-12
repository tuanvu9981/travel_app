import 'package:flutter/material.dart';
import 'package:travel_app/screens/home/booking.tab.dart';
import 'package:travel_app/screens/home/main.tab.dart';
import 'package:travel_app/screens/home/personal.tab.dart';
import '../../utils/home.info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  final int _currentHour = DateTime.now().hour;

  Widget _buildAppbarGreetingByHour(int hour) {
    Greeting greeting = HomeInfoUtil().greetingByHour(hour);
    return Row(
      children: [
        Text(
          greeting.text,
          style: const TextStyle(
            fontSize: 20.0,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
          ),
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
        child: _currentTab == 0
            ? MainTab()
            : _currentTab == 1
                ? const BookingTab()
                : const PersonalTab(),
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
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
            .toList(),
      ),
    );
  }
}

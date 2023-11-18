import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/screens/home/booking.tab.dart';
import 'package:travel_app/screens/home/main.tab.dart';
import 'package:travel_app/screens/home/personal.tab.dart';

import '../../utils/home.info.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentTab = 0;
  final int _currentHour = DateTime.now().hour;

  Widget _buildAppbarGreetingByHour(int hour, BuildContext context) {
    String? fullname = ref.watch(userProvider)!.fullname;
    Greeting greeting = HomeInfoUtil().greetingByHour(hour, fullname!, context);
    return Row(
      children: [
        Text(
          greeting.text,
          style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'VNPro',
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
    String? avatarUrl = ref.watch(userProvider)!.avatarUrl;
    return Scaffold(
      appBar: AppBar(
        title: _buildAppbarGreetingByHour(_currentHour, context),
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
            .buildBtmNavIcons(avatarUrl!, context)
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
            .toList(),
      ),
    );
  }
}

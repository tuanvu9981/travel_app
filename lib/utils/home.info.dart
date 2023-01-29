import 'package:flutter/material.dart';
import './btm.nav.info.dart';

class Greeting {
  String text;
  IconData icons;
  Greeting({required this.text, required this.icons});
}

class HomeInfoUtil {
  // futureL: call api to get user avatar instead of hard-coded
  final List<BtmNavInfo> btmNavIcons = [
    BtmNavInfo(icon: const Icon(Icons.home, size: 30.0), label: "Home"),
    BtmNavInfo(
      icon: const Icon(Icons.history_edu_outlined, size: 30.0),
      label: "Booking",
    ),
    BtmNavInfo(
      icon: const CircleAvatar(
        radius: 15.0,
        backgroundImage: AssetImage('assets/images/duck.jpg'),
      ),
      label: "Personal",
    ),
  ];

  Greeting greetingByHour(int hour) {
    Greeting greeting = Greeting(text: "Welcome, Tuan Vu", icons: Icons.block);
    if (hour <= 12 && hour >= 5) {
      greeting.text = "Good morning, Tuan Vu";
      greeting.icons = Icons.wb_sunny;
    } else if ((hour > 12) && (hour <= 17)) {
      greeting.text = "Good afternoon, Tuan Vu";
      greeting.icons = Icons.wb_sunny;
    } else if ((hour > 17) && (hour < 23)) {
      greeting.text = "Good evening, Tuan Vu";
      greeting.icons = Icons.nights_stay;
    } else {
      greeting.text = "Good night, Tuan Vu";
      greeting.icons = Icons.nights_stay;
    }
    return greeting;
  }
}

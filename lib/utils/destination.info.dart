import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'btm.nav.info.dart';

class DestinationInfo {
  final List<BtmNavInfo> btmNavIcons = [
    BtmNavInfo(
      icon: const Icon(Icons.run_circle_outlined, size: 30.0),
      label: "Activity",
    ),
    BtmNavInfo(
      // icon: const Icon(FontAwesomeIcons.hamburger, size: 30.0),
      icon: const Icon(Icons.food_bank_outlined, size: 30.0),
      label: "Food",
    ),
    BtmNavInfo(
      icon: const Icon(FontAwesomeIcons.hotel, size: 30.0),
      label: "Hotel",
    )
  ];
}

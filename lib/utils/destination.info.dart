import 'package:flutter/material.dart';

import 'btm.nav.info.dart';

class DestinationInfo {
  final List<BtmNavInfo> btmNavIcons = [
    BtmNavInfo(
      icon: const Icon(Icons.run_circle_outlined, size: 30.0),
      label: "Activities",
    ),
    BtmNavInfo(
      icon: const Icon(Icons.food_bank_outlined, size: 30.0),
      label: "Food",
    ),
    BtmNavInfo(
      icon: const Icon(Icons.house_outlined, size: 30.0),
      label: "Hotels",
    )
  ];
}

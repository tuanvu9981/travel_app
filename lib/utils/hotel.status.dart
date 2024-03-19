import 'package:flutter/material.dart';

class RoomStatus {
  Icon icon;
  String text;
  RoomStatus({required this.icon, required this.text});
}

class LStatus {
  final statusStyle = const TextStyle(fontFamily: 'VNPro', fontSize: 16.0);
  final status = <RoomStatus>[
    RoomStatus(
      icon: Icon(Icons.circle, size: 22.5, color: Colors.green[300]),
      text: 'vacant',
    ),
    RoomStatus(
      icon: Icon(Icons.circle, size: 22.5, color: Colors.orange[200]),
      text: 'booked',
    ),
    RoomStatus(
      icon: Icon(Icons.circle, size: 22.5, color: Colors.red[400]),
      text: 'staying',
    )
  ];

  final levels = <RoomStatus>[
    RoomStatus(
      icon: const Icon(Icons.eco, size: 22.5, color: Colors.black54),
      text: 'economy',
    ),
    RoomStatus(
      icon:
          const Icon(Icons.business_center, size: 22.5, color: Colors.black54),
      text: 'business',
    ),
    RoomStatus(
      icon: const Icon(Icons.stars_rounded, size: 22.5, color: Colors.black54),
      text: 'luxury',
    ),
  ];

  num calculateRoomPriceWithLevel(String level, String price) {
    final prices = price.split(" ");
    if (level == 'economy') {
      return int.parse(prices[0]);
    } else if (level == 'business') {
      return int.parse(prices[0]) * 1.2;
    } else {
      return int.parse(prices[0]) * 1.5;
    }
  }
}

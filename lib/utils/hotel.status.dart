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
      icon: Icon(Icons.business_center, size: 22.5, color: Colors.black54),
      text: 'business',
    ),
    RoomStatus(
      icon: const Icon(Icons.stars_rounded, size: 22.5, color: Colors.black54),
      text: 'luxury',
    ),
  ];

  num calculateRoomPriceWithLevel(String level, num price) {
    if (level == 'economy') {
      return price;
    } else if (level == 'business') {
      return price * 1.2;
    } else {
      return price * 1.5;
    }
  }
}

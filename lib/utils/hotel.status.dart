import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'package:travel_app/utils/home.info.dart';

class RoomStatus {
  Icon icon;
  Text text;
  RoomStatus({required this.icon, required this.text});
}

class LStatus {
  final status = <RoomStatus>[
    RoomStatus(
      icon: Icon(Icons.circle, size: 22.5, color: Colors.green[300]),
      text: const Text(
        'Vacant',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 16.0),
      ),
    ),
    RoomStatus(
      icon: Icon(Icons.circle, size: 22.5, color: Colors.orange[200]),
      text: const Text(
        'Booked',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 16.0),
      ),
    ),
    RoomStatus(
      icon: Icon(Icons.circle, size: 22.5, color: Colors.red[400]),
      text: const Text(
        'Staying',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 16.0),
      ),
    )
  ];

  final levels = <RoomStatus>[
    RoomStatus(
      icon: const Icon(Icons.eco, size: 22.5, color: Colors.black54),
      text: const Text(
        'Economy',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 16.0),
      ),
    ),
    RoomStatus(
      icon: const Icon(
        Icons.business_center,
        size: 22.5,
        color: Colors.black54,
      ),
      text: const Text(
        'Business',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 16.0),
      ),
    ),
    RoomStatus(
      icon: const Icon(Icons.stars_rounded, size: 22.5, color: Colors.black54),
      text: const Text(
        'Luxury',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 16.0),
      ),
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

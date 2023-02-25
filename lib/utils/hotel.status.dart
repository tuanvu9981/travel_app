import 'package:flutter/material.dart';

class RoomStatus {
  Icon icon;
  Text text;
  RoomStatus({required this.icon, required this.text});
}

class LStatus {
  final status = <RoomStatus>[
    RoomStatus(
      icon: Icon(Icons.circle, size: 25.0, color: Colors.green[300]),
      text: const Text(
        'Vacant',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 18.0),
      ),
    ),
    RoomStatus(
      icon: Icon(Icons.circle, size: 25.0, color: Colors.orange[200]),
      text: const Text(
        'Booked & Waiting',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 18.0),
      ),
    ),
    RoomStatus(
      icon: Icon(Icons.circle, size: 25.0, color: Colors.red[400]),
      text: const Text(
        'Staying',
        style: TextStyle(fontFamily: 'VNPro', fontSize: 18.0),
      ),
    )
  ];
}

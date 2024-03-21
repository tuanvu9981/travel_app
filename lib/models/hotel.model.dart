import "package:cloud_firestore/cloud_firestore.dart";
import 'package:travel_app/models/multi-lang.model.dart';

class Room {
  String? roomId;
  String? status;
  String? level;
  String? intendedCheckinTime;
  String? intendedCheckoutTime;

  Room({
    this.roomId,
    this.status,
    this.level,
    this.intendedCheckinTime,
    this.intendedCheckoutTime,
  });

  Room.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'] as String;
    status = json['status'] as String;
    level = json['level'] as String;
    if (json['intendedCheckinTime'] != null) {
      intendedCheckinTime = json['intendedCheckinTime'];
    }
    if (json['intendedCheckoutTime'] != null) {
      intendedCheckoutTime = json['intendedCheckoutTime'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['status'] = status;
    data['level'] = level;
    data['intendedCheckinTime'] = intendedCheckinTime;
    data['intendedCheckoutTime'] = intendedCheckoutTime;
    return data;
  }
}

class Floor {
  int? floor;
  List<Room>? rooms;
  Floor({this.floor, this.rooms});

  Floor.fromJson(Map<String, dynamic> json) {
    floor = json['floor'] as int;
    if (json['rooms'] != null) {
      List<Map<String, dynamic>> mapRooms =
          json['rooms'].cast<Map<String, dynamic>>();

      rooms = mapRooms
          .map(
            (r) => Room.fromJson(r),
          )
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['floor'] = floor;
    if (rooms != null) {
      data['rooms'] = rooms!.map((r) => r.toJson()).toList();
    }
    return data;
  }
}

class Hotel {
  String? id;
  String? imageUrl;
  MultiLang? name;
  MultiLang? address;
  MultiLang? price;
  List<Floor>? floors;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
    this.floors,
  });

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    imageUrl = json['imageUrl'];
    name = json['name'] != null ? MultiLang.fromJson(json['name']) : null;
    address =
        json['address'] != null ? MultiLang.fromJson(json['address']) : null;
    price = json['price'] != null ? MultiLang.fromJson(json['price']) : null;

    if (json['floors'] != null) {
      List<Map<String, dynamic>> mapFloors =
          json['floors'].cast<Map<String, dynamic>>();

      floors = mapFloors
          .map(
            (f) => Floor.fromJson(f),
          )
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    data['name'] = name != null ? name!.toJson() : null;
    data['address'] = address != null ? name!.toJson() : null;
    data['price'] = price != null ? price!.toJson() : null;

    if (floors != null) {
      data['floors'] = floors!.map((f) => f.toJson()).toList();
    }
    return data;
  }

  Hotel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    String documentId,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    imageUrl = data?['imageUrl'];
    id = documentId;
    name = data?['name'] != null ? MultiLang.fromJson(data?['name']) : null;
    price = data?['price'] != null ? MultiLang.fromJson(data?['price']) : null;
    address =
        data?['address'] != null ? MultiLang.fromJson(data?['address']) : null;

    if (data?['floors'] != null) {
      List<Map<String, dynamic>> mapFloors =
          data?['floors'].cast<Map<String, dynamic>>();
      floors = mapFloors.map((c) => Floor.fromJson(c)).toList();
    }
  }
}

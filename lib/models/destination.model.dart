import "package:cloud_firestore/cloud_firestore.dart";
import 'package:travel_app/models/activity.model.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'package:travel_app/models/multi-lang.model.dart';

class Destination {
  String? id;
  String? imageUrl;
  MultiLang? city;
  MultiLang? country;
  MultiLang? description;
  List<Activity>? activities;
  List<Hotel>? hotels;

  Destination({
    this.id,
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
    this.hotels,
  });

  Destination.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    imageUrl = json['imageUrl'];
    city = json['city'] != null ? MultiLang.fromJson(json['city']) : null;
    country =
        json['country'] != null ? MultiLang.fromJson(json['country']) : null;
    description = json['description'] != null
        ? MultiLang.fromJson(json['description'])
        : null;

    if (json['activities'] != null) {
      List<Map<String, dynamic>> mapActivities =
          json['activities'].cast<Map<String, dynamic>>();

      activities = mapActivities
          .map(
            (a) => Activity.fromJson(a),
          )
          .toList();
    }
    if (json['hotels'] != null) {
      List<Map<String, dynamic>> mapHotels =
          json['hotels'].cast<Map<String, dynamic>>();

      hotels = mapHotels
          .map(
            (h) => Hotel.fromJson(h),
          )
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['city'] = city != null ? city!.toJson() : null;
    data['country'] = country != null ? country!.toJson() : null;
    data['description'] = description != null ? description!.toJson() : null;

    if (activities != null) {
      data['activities'] = activities!.map((v) => v.toJson()).toList();
    }
    if (hotels != null) {
      data['hotels'] = hotels!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Destination.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    imageUrl = data?['imageUrl'];
    id = data?['id'];

    city = data?['city'] != null ? MultiLang.fromJson(data?['city']) : null;
    country =
        data?['country'] != null ? MultiLang.fromJson(data?['country']) : null;
    description = data?['description'] != null
        ? MultiLang.fromJson(data?['description'])
        : null;

    if (data?['hotels'] != null) {
      List<Map<String, dynamic>> mapHotels =
          data?['hotels'].cast<Map<String, dynamic>>();
      hotels = mapHotels.map((c) => Hotel.fromJson(c)).toList();
    }

    if (data?['activities'] != null) {
      List<Map<String, dynamic>> mapActivities =
          data?['activities'].cast<Map<String, dynamic>>();
      activities = mapActivities.map((c) => Activity.fromJson(c)).toList();
    }
  }
}

import 'package:travel_app/models/activity.model.dart';

import 'activity.model.dart';
import 'hotel.model.dart';

class Destination {
  String? id;
  String? imageUrl;
  String? city;
  String? country;
  String? description;
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
    city = json['city'];
    country = json['country'];
    description = json['description'];

    if (json['activities'] != null) {
      activities = <Activity>[];
      json['activities'].forEach((v) {
        activities!.add(Activity.fromJson(v));
      });
    }
    if (json['hotels'] != null) {
      hotels = <Hotel>[];
      json['hotels'].forEach((v) {
        hotels!.add(Hotel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['city'] = city;
    data['country'] = country;
    data['description'] = description;

    if (activities != null) {
      data['activities'] = activities!.map((v) => v.toJson()).toList();
    }
    if (hotels != null) {
      data['hotels'] = hotels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

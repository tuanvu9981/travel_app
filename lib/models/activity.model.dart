import "package:cloud_firestore/cloud_firestore.dart";

import "multi-lang.model.dart";

class Activity {
  List<String>? type;
  String? imageUrl;
  String? businessTime;
  int? rating;
  MultiLang? price;
  MultiLang? name;

  Activity({
    this.imageUrl,
    this.name,
    this.type,
    this.businessTime,
    this.rating,
    this.price,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    type = json['type'].cast<String>();
    imageUrl = json['imageUrl'];
    rating = json['rating'];
    businessTime = json['businessTime'];
    name = json['name'] != null ? MultiLang.fromJson(json['name']) : null;
    price = json['price'] != null ? MultiLang.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['type'] = type;
    data['businessTime'] = businessTime;
    data['rating'] = rating;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }

  Activity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    type = data?['type'] is Iterable ? List.from(data?['type']) : null;
    imageUrl = data?['imageUrl'];
    rating = data?['rating'];
    businessTime = data?['businessTime'];
    name = data?['name'] != null ? MultiLang.fromJson(data?['name']) : null;
    price = data?['price'] != null ? MultiLang.fromJson(data?['price']) : null;
  }
}

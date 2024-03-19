import "package:cloud_firestore/cloud_firestore.dart";
import 'package:travel_app/models/multi-lang.model.dart';

class Food {
  String? imageUrl;
  String? destinationId;

  MultiLang? address;
  MultiLang? foodName;
  MultiLang? price;

  Food({
    this.address,
    this.foodName,
    this.imageUrl,
    this.price,
    this.destinationId,
  });

  Food.fromJson(Map<String, dynamic> json) {
    destinationId = json['destinationId'] as String;
    imageUrl = json['imageUrl'] as String;

    address =
        json['address'] != null ? MultiLang.fromJson(json['address']) : null;
    foodName =
        json['foodName'] != null ? MultiLang.fromJson(json['foodName']) : null;
    price = json['price'] != null ? MultiLang.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['destinationId'] = destinationId;

    data['address'] = address != null ? address!.toJson() : null;
    data['foodName'] = foodName != null ? foodName!.toJson() : null;
    data['price'] = price != null ? price!.toJson() : null;
    return data;
  }

  Food.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    imageUrl = data?['imageUrl'];
    destinationId = data?['destinationId'];

    address =
        data?['address'] != null ? MultiLang.fromJson(data?['address']) : null;
    foodName = data?['foodName'] != null
        ? MultiLang.fromJson(data?['foodName'])
        : null;
    price = data?['price'] != null ? MultiLang.fromJson(data?['price']) : null;
  }
}

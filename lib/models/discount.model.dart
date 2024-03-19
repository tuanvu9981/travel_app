import "package:cloud_firestore/cloud_firestore.dart";
import 'package:travel_app/models/multi-lang.model.dart';

class DiscountInfo {
  String? startDate;
  String? endDate;
  String? imageUrl;
  MultiLang? title;
  MultiLang? instruction;
  MultiLang? appliedPlace;
  List<Contact>? contact;

  DiscountInfo({
    this.startDate,
    this.endDate,
    this.title,
    this.instruction,
    this.imageUrl,
    this.appliedPlace,
    this.contact,
  });

  DiscountInfo.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'] as String;
    endDate = json['endDate'] as String;
    imageUrl = json['imageUrl'] as String;
    title = json['title'] != null ? MultiLang.fromJson(json['title']) : null;
    instruction = json['instruction'] != null
        ? MultiLang.fromJson(json['instruction'])
        : null;
    appliedPlace = json['appliedPlace'] != null
        ? MultiLang.fromJson(json['appliedPlace'])
        : null;

    if (json['contact'] != null) {
      List<Map<String, dynamic>> mapContacts =
          json['contact'].cast<Map<String, dynamic>>();
      contact = mapContacts.map((c) => Contact.fromJson(c)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['imageUrl'] = imageUrl;

    data['title'] = title != null ? title!.toJson() : null;
    data['instruction'] = instruction != null ? instruction!.toJson() : null;
    data['appliedPlace'] = appliedPlace != null ? appliedPlace!.toJson() : null;

    if (contact != null) {
      data['contact'] = contact!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  DiscountInfo.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    imageUrl = data?['imageUrl'];
    startDate = data?['startDate'];
    endDate = data?['endDate'];

    title = data?['title'] != null ? MultiLang.fromJson(data?['title']) : null;
    instruction = data?['instruction'] != null
        ? MultiLang.fromJson(data?['instruction'])
        : null;
    appliedPlace = data?['appliedPlace'] != null
        ? MultiLang.fromJson(data?['appliedPlace'])
        : null;

    if (data?['contact'] != null) {
      List<Map<String, dynamic>> mapContacts =
          data?['contact'].cast<Map<String, dynamic>>();
      contact = mapContacts.map((c) => Contact.fromJson(c)).toList();
    }
  }
}

class Contact {
  String? email;
  String? phone;

  Contact({this.email, this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    phone = json['phone'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

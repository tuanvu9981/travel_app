class DiscountInfo {
  String? startDate;
  String? endDate;
  String? title;
  String? instruction;
  String? imageUrl;
  String? appliedPlace;
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
    title = json['title'] as String;
    instruction = json['instruction'] as String;
    imageUrl = json['imageUrl'] as String;
    appliedPlace = json['appliedPlace'] as String;

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
    data['title'] = title;
    data['instruction'] = instruction;
    data['imageUrl'] = imageUrl;
    data['appliedPlace'] = appliedPlace;
    if (contact != null) {
      data['contact'] = contact!.map((v) => v.toJson()).toList();
    }
    return data;
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

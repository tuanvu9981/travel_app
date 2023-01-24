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
    startDate = json['startDate'];
    endDate = json['endDate'];
    title = json['title'];
    instruction = json['instruction'];
    imageUrl = json['imageUrl'];
    appliedPlace = json['appliedPlace'];
    if (json['contact'] != null) {
      contact = <Contact>[];
      json['contact'].forEach((v) {
        contact!.add(Contact.fromJson(v));
      });
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
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

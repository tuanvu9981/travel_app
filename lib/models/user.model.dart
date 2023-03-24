class User {
  String? id;
  String? email;
  String? fullname;
  String? avatarUrl;
  String? role;
  String? phoneNumber;
  String? birthday;
  num? money;

  User({
    this.id,
    this.email,
    this.fullname,
    this.avatarUrl,
    this.role,
    this.phoneNumber,
    this.birthday,
    this.money,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'] as String;
    fullname = json['fullname'] as String;
    avatarUrl = json['avatarUrl'] as String;
    role = json['role'] as String;
    // phoneNumber = json['phoneNumber'] as String;
    // birthday = json['birthday'] as String;
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullname'] = fullname;
    data['avatarUrl'] = avatarUrl;
    data['role'] = role;
    data['money'] = money;
    // data['phoneNumber'] = phoneNumber;
    // data['birthday'] = birthday;
    data['id'] = id;
    return data;
  }
}

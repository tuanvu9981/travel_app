class User {
  String? email;
  String? fullname;
  String? avatarUrl;
  String? role;
  String? money;

  User({
    this.email,
    this.fullname,
    this.avatarUrl,
    this.role,
    this.money,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    fullname = json['fullname'] as String;
    avatarUrl = json['avatarUrl'] as String;
    role = json['role'] as String;
    money = json['money'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullname'] = fullname;
    data['avatarUrl'] = avatarUrl;
    data['role'] = role;
    data['money'] = money;
    return data;
  }
}

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
    email = json['email'];
    fullname = json['fullname'];
    avatarUrl = json['avatarUrl'];
    role = json['role'];
    money = json['money'];
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

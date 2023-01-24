class Activity {
  String? imageUrl;
  String? name;
  String? type;
  List<String>? startTimes;
  int? rating;
  int? price;

  Activity({
    this.imageUrl,
    this.name,
    this.type,
    this.startTimes,
    this.rating,
    this.price,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    name = json['name'];
    type = json['type'];
    startTimes = json['startTimes'].cast<String>();
    rating = json['rating'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['type'] = type;
    data['startTimes'] = startTimes;
    data['rating'] = rating;
    data['price'] = price;
    return data;
  }
}

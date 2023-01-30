class Food {
  String? address;
  String? foodName;
  String? imageUrl;
  String? english;
  double? price;
  String? destinationId;

  Food({
    this.address,
    this.foodName,
    this.imageUrl,
    this.english,
    this.price,
    this.destinationId,
  });

  Food.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    foodName = json['foodName'];
    imageUrl = json['imageUrl'];
    english = json['english'];
    price = json['price'];
    destinationId = json['destinationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = address;
    data['foodName'] = foodName;
    data['imageUrl'] = imageUrl;
    data['english'] = english;
    data['price'] = price;
    data['destinationId'] = destinationId;
    return data;
  }
}

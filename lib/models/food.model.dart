class Food {
  String? address;
  String? foodName;
  String? imageUrl;
  String? english;
  num? price;
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
    address = json['address'] as String;
    foodName = json['foodName'] as String;
    imageUrl = json['imageUrl'] as String;
    english = json['english'] as String;
    price = json['price'];
    destinationId = json['destinationId'] as String;
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

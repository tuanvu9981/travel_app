class History {
  String? hotelImgUrl;
  String? hotelName;
  String? hotelAddress;
  String? roomId;
  num? price;
  String? roomLevel;
  String? bookingDate;
  String? checkInDate;
  String? checkOutDate;

  History({
    this.hotelImgUrl,
    this.hotelName,
    this.hotelAddress,
    this.roomId,
    this.price,
    this.roomLevel,
    this.bookingDate,
    this.checkInDate,
    this.checkOutDate,
  });

  History.fromJson(Map<String, dynamic> json) {
    hotelImgUrl = json['hotelImgUrl'];
    hotelName = json['hotelName'];
    hotelAddress = json['hotelAddress'];
    roomId = json['roomId'];
    price = json['price'] as num;
    roomLevel = json['roomLevel'];
    bookingDate = json['bookingDate'];
    checkInDate = json['checkInDate'];
    checkOutDate = json['checkOutDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelImgUrl'] = hotelImgUrl;
    data['hotelName'] = hotelName;
    data['hotelAddress'] = hotelAddress;
    data['roomId'] = roomId;
    data['price'] = price;
    data['roomLevel'] = roomLevel;
    data['bookingDate'] = bookingDate;
    data['checkInDate'] = checkInDate;
    data['checkOutDate'] = checkOutDate;
    return data;
  }
}

class BookingHistory {
  String? bookingHistoryId;
  String? userId;
  List<History>? histories;

  BookingHistory({this.userId, this.histories});

  BookingHistory.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    bookingHistoryId = json['_id'];
    if (json['histories'] != null) {
      List<Map<String, dynamic>> mapHistories =
          json['histories'].cast<Map<String, dynamic>>();
      histories = mapHistories.map((h) => History.fromJson(h)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['bookingHistoryId'] = bookingHistoryId;
    if (histories != null) {
      data['histories'] = histories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

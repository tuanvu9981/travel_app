class History {
  String? hotelImgUrl;
  String? hotelName;
  String? hotelAddress;
  String? roomId;
  num? price;
  String? roomLevel;
  DateTime? bookingDate;
  DateTime? checkInDate;
  DateTime? checkOutDate;

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
}

class BookingHistory {
  String? userId;
  List<History>? histories;

  BookingHistory({this.userId, this.histories});
}

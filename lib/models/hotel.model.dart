class Room {
  String? roomId;
  String? status;
  int? floor;
  String? level;
  String? intendedCheckinTime;
  String? intendedCheckoutTime;

  Room({
    this.roomId,
    this.status,
    this.floor,
    this.level,
    this.intendedCheckinTime,
    this.intendedCheckoutTime,
  });

  Room.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    status = json['status'];
    floor = json['floor'];
    level = json['level'];
    if (json['intendedCheckinTime'] != null) {
      intendedCheckinTime = json['intendedCheckinTime'];
    }
    if (json['intendedCheckoutTime'] != null) {
      intendedCheckoutTime = json['intendedCheckoutTime'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['status'] = status;
    data['floor'] = floor;
    data['level'] = level;
    data['intendedCheckinTime'] = intendedCheckinTime;
    data['intendedCheckoutTime'] = intendedCheckoutTime;
    return data;
  }
}

class Hotel {
  String? imageUrl;
  String? name;
  String? address;
  int? price;
  List<Room>? rooms;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
    this.rooms,
  });

  Hotel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    name = json['name'];
    address = json['type'];
    price = json['price'];
    if (json['rooms'] != null) {
      rooms = <Room>[];
      json['rooms'].forEach((r) {
        rooms!.add(Room.fromJson(r));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['address'] = address;
    data['price'] = price;

    if (rooms != null) {
      data['rooms'] = rooms!.map((r) => r.toJson()).toList();
    }
    return data;
  }
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/discount3.jpg',
    name: 'Tropical Heaven',
    address: '404 Ankas St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/discount1.jpeg',
    name: 'Vườn Huế Xưa',
    address: '404 Duy Tan St',
    price: 210,
  ),
  Hotel(
    imageUrl: 'assets/images/discount4.jpg',
    name: 'Little Maldives',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/discount2.jpg',
    name: 'Great Nature',
    address: '404 Marius St',
    price: 240,
  ),
  Hotel(
    imageUrl: 'assets/images/travel-after-lockdown.jpg',
    name: 'JM Marvel Hanoi',
    address: '198 Nguyen Luong Bang St',
    price: 158,
  ),
];

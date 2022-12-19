class Hotel {
  String? imageUrl;
  String? name;
  String? address;
  int? price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Tropical Heaven',
    address: '404 Ankas St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/VuonHueXua.jpg',
    name: 'Vườn Huế Xưa',
    address: '404 Duy Tan St',
    price: 210,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Little Maldives',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Great Nature',
    address: '404 Marius St',
    price: 240,
  ),
  Hotel(
    imageUrl: 'assets/images/JMMarvel.jpg',
    name: 'JM Marvel Hanoi',
    address: '198 Nguyen Luong Bang St',
    price: 158,
  ),
];

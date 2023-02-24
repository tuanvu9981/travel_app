import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/hotel.model.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({Key? key}) : super(key: key);

  @override
  BookingTabState createState() => BookingTabState();
}

class BookingTabState extends State<BookingTab> {
  final _sloganStyle = TextStyle(fontSize: 28.0, fontFamily: 'DancingScript');
  final hotel1 = Hotel(
    imageUrl: 'assets/images/hotel1.jpeg',
    name: 'ShengWang Hotel',
    address: '1234 Yunnan street, Renmin Avenue, Shanghai',
    price: 509,
  );

  final hotel2 = Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Yoshida Hotel',
    address: '1234 Yoshida street, Meiji Avenue, Tokyo',
    price: 608,
  );

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text("Your Booking History", style: _sloganStyle),
                    Icon(
                      Icons.history_edu_outlined,
                      size: 35.0,
                      color: Colors.lightGreen[300],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.5),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      color: Colors.white,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 37.5,
                              backgroundImage:
                                  AssetImage('assets/images/hotel1.jpeg'),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.house_outlined,
                                      size: 25.0,
                                      color: Colors.orange[300],
                                    ),
                                    const SizedBox(width: 7.5),
                                    Text(
                                      hotel1.name ?? "",
                                      style: const TextStyle(
                                        fontFamily: 'VNPro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 25.0,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(width: 7.5),
                                    Container(
                                      width: 220,
                                      child: Text(
                                        hotel1.address ?? "",
                                        style: const TextStyle(
                                          fontFamily: 'VNPro',
                                          fontSize: 15.0,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 0.25, color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: const [
                                Text(
                                  'Room 209',
                                  style: TextStyle(
                                    fontFamily: 'VNPro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.5,
                                  ),
                                ),
                                Text(
                                  'Luxury',
                                  style: TextStyle(
                                    fontFamily: 'VNPro',
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  'Total: ${hotel1.price! * 2 * 3} \$',
                                  style: const TextStyle(
                                    fontFamily: 'VNPro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.5,
                                    color: Colors.green,
                                  ),
                                ),
                                const Text(
                                  '5 nights',
                                  style: TextStyle(
                                    fontFamily: 'VNPro',
                                    fontSize: 15.0,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 7.5,
                        bottom: 7.5,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 0.25, color: Colors.grey),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 27.5,
                                color: Colors.lightBlue[300],
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                '8:30, March 20th 2023',
                                style: TextStyle(
                                  fontFamily: 'VNPro',
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7.5),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 27.5,
                                color: Colors.lightBlue[300],
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                '17:30, March 23th 2023',
                                style: TextStyle(
                                  fontFamily: 'VNPro',
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.5),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      color: Colors.white,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 37.5,
                              backgroundImage:
                                  AssetImage('assets/images/hotel2.jpg'),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.house_outlined,
                                      size: 25.0,
                                      color: Colors.orange[300],
                                    ),
                                    const SizedBox(width: 7.5),
                                    Text(
                                      hotel2.name ?? "",
                                      style: const TextStyle(
                                        fontFamily: 'VNPro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 25.0,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(width: 7.5),
                                    Container(
                                      width: 220,
                                      child: Text(
                                        hotel2.address ?? "",
                                        style: const TextStyle(
                                          fontFamily: 'VNPro',
                                          fontSize: 15.0,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 0.25, color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: const [
                                Text(
                                  'Room 403',
                                  style: TextStyle(
                                    fontFamily: 'VNPro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.5,
                                  ),
                                ),
                                Text(
                                  'Economy',
                                  style: TextStyle(
                                    fontFamily: 'VNPro',
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  'Total: ${hotel2.price! * 2 * 3} \$',
                                  style: const TextStyle(
                                    fontFamily: 'VNPro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.5,
                                    color: Colors.green,
                                  ),
                                ),
                                const Text(
                                  '4 nights',
                                  style: TextStyle(
                                    fontFamily: 'VNPro',
                                    fontSize: 15.0,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 7.5,
                        bottom: 7.5,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(width: 0.25, color: Colors.grey),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 27.5,
                                color: Colors.lightBlue[300],
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                '9:00, May 16th 2022',
                                style: TextStyle(
                                  fontFamily: 'VNPro',
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7.5),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 27.5,
                                color: Colors.lightBlue[300],
                              ),
                              const SizedBox(width: 15.0),
                              const Text(
                                '15:30, May 25th 2022',
                                style: TextStyle(
                                  fontFamily: 'VNPro',
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

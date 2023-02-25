import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'package:travel_app/utils/home.info.dart';
import 'package:travel_app/utils/hotel.status.dart';

class BookingRoom extends StatefulWidget {
  final hotel = Hotel(
    imageUrl: 'assets/images/hotel1.jpeg',
    name: 'ShengWang Hotel',
    address: '1234 Yunnan street, Renmin Avenue, Shanghai',
    price: 509,
    rooms: <Room>[
      Room(
        roomId: '200',
        status: 'booked',
        floor: 2,
        level: 'luxury',
        intendedCheckinTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-23 09:30:01Z'),
        ),
        intendedCheckoutTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-26 16:30:02Z'),
        ),
      ),
      Room(
        roomId: '201',
        status: 'vacant',
        floor: 2,
        level: 'luxury',
      ),
      Room(
        roomId: '202',
        status: 'stayed',
        floor: 2,
        level: 'economy',
        intendedCheckinTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-23 09:30:01Z'),
        ),
        intendedCheckoutTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-26 16:30:02Z'),
        ),
      ),
      Room(
        roomId: '300',
        status: 'vacant',
        floor: 3,
        level: 'luxury',
      ),
      Room(
        roomId: '301',
        status: 'stayed',
        floor: 3,
        level: 'economy',
        intendedCheckinTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-23 09:30:01Z'),
        ),
        intendedCheckoutTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-26 16:30:02Z'),
        ),
      ),
      Room(
        roomId: '302',
        status: 'stayed',
        floor: 3,
        level: 'economy',
        intendedCheckinTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-23 09:30:01Z'),
        ),
        intendedCheckoutTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-26 16:30:02Z'),
        ),
      ),
      Room(
        roomId: '400',
        status: 'booked',
        floor: 4,
        level: 'luxury',
        intendedCheckinTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-03-18T16:00:00Z'),
        ),
        intendedCheckoutTime: HomeInfoUtil().formatDateTime(
          DateTime.parse('2023-01-26 16:30:02Z'),
        ),
      ),
      Room(
        roomId: '401',
        status: 'vacant',
        floor: 4,
        level: 'economy',
      ),
      Room(
        roomId: '402',
        status: 'vacant',
        floor: 4,
        level: 'economy',
      ),
    ],
  );

  BookingRoom({Key? key}) : super(key: key);

  @override
  BookingRoomState createState() => BookingRoomState();
}

class BookingRoomState extends State<BookingRoom> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildStatusLine(RoomStatus roomStatus) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.5, vertical: 10.0),
      child: Row(
        children: [
          roomStatus.icon,
          const SizedBox(width: 10.0),
          roomStatus.text
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking rooms',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: AssetImage(widget.hotel.imageUrl!),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 135.0,
                    color: Colors.white.withOpacity(0.35),
                    colorBlendMode: BlendMode.modulate,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hotel.name!,
                          style: const TextStyle(
                            fontFamily: 'Mukta',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 22.5,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 5.0),
                            Container(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text(
                                widget.hotel.address!,
                                style: const TextStyle(
                                  fontFamily: 'Mukta',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ...LStatus().status.map((e) => _buildStatusLine(e)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

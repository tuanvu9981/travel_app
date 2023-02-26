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
    floors: <Floor>[
      Floor(
        floor: 2,
        rooms: <Room>[
          Room(
            roomId: '200',
            status: 'booked',
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
            level: 'luxury',
          ),
          Room(
            roomId: '202',
            status: 'stayed',
            level: 'economy',
            intendedCheckinTime: HomeInfoUtil().formatDateTime(
              DateTime.parse('2023-01-23 09:30:01Z'),
            ),
            intendedCheckoutTime: HomeInfoUtil().formatDateTime(
              DateTime.parse('2023-01-26 16:30:02Z'),
            ),
          ),
          Room(
            roomId: '203',
            status: 'vacant',
            level: 'luxury',
          ),
        ],
      ),
      Floor(
        floor: 3,
        rooms: <Room>[
          Room(
            roomId: '300',
            status: 'vacant',
            level: 'luxury',
          ),
          Room(
            roomId: '301',
            status: 'stayed',
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
            status: 'booked',
            level: 'economy',
            intendedCheckinTime: HomeInfoUtil().formatDateTime(
              DateTime.parse('2023-01-23 09:30:01Z'),
            ),
            intendedCheckoutTime: HomeInfoUtil().formatDateTime(
              DateTime.parse('2023-01-26 16:30:02Z'),
            ),
          ),
          Room(
            roomId: '303',
            status: 'vacant',
            level: 'luxury',
          ),
        ],
      ),
      Floor(
        floor: 4,
        rooms: <Room>[
          Room(
            roomId: '400',
            status: 'booked',
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
            level: 'economy',
          ),
          Room(
            roomId: '402',
            status: 'vacant',
            level: 'economy',
          ),
          Room(
            roomId: '403',
            status: 'booked',
            level: 'economy',
            intendedCheckinTime: HomeInfoUtil().formatDateTime(
              DateTime.parse('2023-01-23 09:30:01Z'),
            ),
            intendedCheckoutTime: HomeInfoUtil().formatDateTime(
              DateTime.parse('2023-01-26 16:30:02Z'),
            ),
          ),
        ],
      )
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

  Widget? _buildMessageWithStatus(String? roomStatus, num? price) {
    if (roomStatus == 'booked') {
      return const Text(
        'Someone booked this room.',
        style: TextStyle(
          fontFamily: 'VNPro',
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      );
    } else if (roomStatus == 'stayed') {
      return Text(
        'Someone is staying here.',
        style: TextStyle(
          fontFamily: 'VNPro',
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.red[400],
        ),
      );
    } else {
      return Container(
        height: 60,
        child: Column(
          children: [
            Text(
              'This room is vacant. You can hire it',
              style: TextStyle(
                fontFamily: 'VNPro',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[300],
              ),
            ),
            Text(
              'Deposit: $price \$',
              style: const TextStyle(
                fontFamily: 'VNPro',
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
  }

  List<Widget>? _buildActionWithStatus(String? status) {
    if (status == 'booked' || status == 'stayed') {
      return [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK', style: TextStyle(fontSize: 16.0)),
        ),
      ];
    } else {
      return [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel', style: TextStyle(fontSize: 16.0)),
        ),
        const SizedBox(height: 2.5),
        TextButton(
          onPressed: () => {
            // call API
            Navigator.pop(context, 'I\'ll hire it'),
          },
          child: const Text('I\'ll hire it', style: TextStyle(fontSize: 16.0)),
        ),
      ];
    }
  }

  Widget _buildRoom(BuildContext context, Room room) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Column(
              children: [
                Text(
                  'Room ${room.roomId!}',
                  style: const TextStyle(
                    fontSize: 17.5,
                    fontFamily: 'VNPro',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2.5),
                Text(
                  '${room.level!}',
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontFamily: 'VNPro',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          content: _buildMessageWithStatus(room.status, widget.hotel.price),
          actions: _buildActionWithStatus(room.status),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.25),
            ),
            child: Container(
              color: room.status == 'vacant'
                  ? Colors.lightGreen[300]
                  : room.status == 'booked'
                      ? Colors.orange[200]
                      : Colors.red[400],
              child: Icon(
                room.level == 'economy'
                    ? Icons.eco_rounded
                    : Icons.stars_rounded,
                size: 27.5,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 2.5),
          Text(
            '${room.roomId}',
            style: const TextStyle(
              fontFamily: 'VNPro',
              fontSize: 12.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloor(BuildContext context, Floor floor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.5, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Floor ${floor.floor}',
            style: const TextStyle(
              fontFamily: 'VNPro',
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: floor.rooms!
                  .map(
                    (e) => _buildRoom(context, e),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatusLine(RoomStatus roomStatus, double width) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width, vertical: 10.0),
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
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: AssetImage(widget.hotel.imageUrl!),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.4,
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
              const SizedBox(height: 12.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ...LStatus()
                            .status
                            .map((e) => _buildStatusLine(e, 30.0))
                            .toList(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ...LStatus()
                            .levels
                            .map((e) => _buildStatusLine(e, 10.0))
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 22.5,
                  vertical: 7.5,
                ),
                child: const Text(
                  'All rooms in our hotel',
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 30.0,
                  ),
                ),
              ),
              ...widget.hotel.floors!
                  .map((f) => _buildFloor(context, f))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

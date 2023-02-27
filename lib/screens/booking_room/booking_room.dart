import 'package:flutter/material.dart';
import 'package:travel_app/apis/hotel.api.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'package:travel_app/utils/hotel.status.dart';

class BookingRoom extends StatefulWidget {
  final String hotelId;
  BookingRoom({required this.hotelId, Key? key}) : super(key: key);

  @override
  BookingRoomState createState() => BookingRoomState();
}

class BookingRoomState extends State<BookingRoom> {
  Hotel? hotel;

  Future<void> _fetchData(String id) async {
    Hotel? data = await HotelApi.getHotelById(id);
    setState(() {
      hotel = data;
    });
  }

  Future<void> _updateHotel(String id, Hotel? newHotel) async {
    await HotelApi.updateHotelById(id, newHotel);
  }

  @override
  void initState() {
    super.initState();
    _fetchData(widget.hotelId);
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
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[300],
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              'Deposit: $price \$',
              style: const TextStyle(
                fontFamily: 'VNPro',
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
  }

  List<Widget>? _buildActionWithStatus(String? status, String? roomId) {
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
            // update color of room
            setState(() {
              hotel?.floors = hotel?.floors!.map<Floor>((f) {
                f.rooms = f.rooms!.map<Room>((r) {
                  if (r.roomId == roomId) {
                    r.status = 'booked';
                  }
                  return r;
                }).toList();
                return f;
              }).toList();
            }),

            // update state back to API Backend
            _updateHotel(widget.hotelId, hotel),
            Navigator.pop(context, 'I\'ll hire it')
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
          content: _buildMessageWithStatus(room.status, hotel?.price),
          actions: _buildActionWithStatus(room.status, room.roomId),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 45,
            width: 45,
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
                    : room.level == 'business'
                        ? Icons.business_center
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
            child: Center(
              child: Wrap(
                spacing: 1.0,
                children: floor.rooms!
                    .map(
                      (e) => _buildRoom(context, e),
                    )
                    .toList(),
              ),
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
          child: hotel?.imageUrl == null
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.lightBlue),
                )
              : ListView(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image(
                          image: NetworkImage(hotel?.imageUrl ?? ""),
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
                                hotel?.name ?? "",
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      hotel?.address ?? "",
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
                    Center(
                      child: Container(
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
                    ),
                    ...?hotel?.floors!
                        .map((f) => _buildFloor(context, f))
                        .toList(),
                  ],
                ),
        ),
      ),
    );
  }
}

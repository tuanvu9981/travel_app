import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'package:travel_app/screens/booking_room/booking_room.dart';

class HotelCard extends StatelessWidget {
  Hotel hotel;
  HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image(
                width: 125.0,
                height: 110.0,
                image: NetworkImage(hotel.imageUrl ?? ""),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.0,
                      child: Text(
                        hotel.name ?? "",
                        style: const TextStyle(
                          fontFamily: 'VNPro',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "\$${hotel.price}",
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade600,
                          ),
                        ),
                        const Text(
                          'per night',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 180.0,
                      child: Text(
                        hotel.address ?? "",
                        style: const TextStyle(
                          fontFamily: 'VNPro',
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7.0),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingRoom(
                        hotelId: hotel.id!,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Check available rooms",
                        style: TextStyle(
                          fontFamily: 'VNPro',
                          fontSize: 13.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.arrow_forward,
                        size: 18.5,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Room>? rooms;

import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel.model.dart';

class HotelCard extends StatelessWidget {
  Hotel hotel;
  HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              child: Image(
                width: 60.0,
                height: 60.0,
                image: NetworkImage(hotel.imageUrl ?? ""),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      hotel.name ?? "",
                      style: const TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${hotel.price}",
                      style: TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12.5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 17.5,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      hotel.address ?? "",
                      style: const TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7.0),
                Row(
                  children: [
                    Text(
                      "Check available rooms",
                      style: TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 13.5,
                        color: Colors.lightBlue.shade300,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    const Icon(
                      Icons.arrow_forward,
                      size: 17.5,
                      color: Colors.white,
                    ),
                  ],
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

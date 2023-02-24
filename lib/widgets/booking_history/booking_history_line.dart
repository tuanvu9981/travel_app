import 'package:flutter/material.dart';
import 'package:travel_app/models/booking-history.model.dart';

class BookingHistoryLine extends StatelessWidget {
  final History userHistory;

  const BookingHistoryLine({
    Key? key,
    required this.userHistory,
  }) : super(key: key);

  final _boldText = const TextStyle(
    fontFamily: 'VNPro',
    fontWeight: FontWeight.bold,
    fontSize: 18.5,
  );

  final _normalText = const TextStyle(
    fontFamily: 'VNPro',
    fontSize: 15.0,
    color: Colors.black54,
  );

  final _tDecoration = const BoxDecoration(
    color: Colors.white,
    border: Border(
      top: BorderSide(width: 0.25, color: Colors.grey),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 37.5,
                    backgroundImage: AssetImage(userHistory.hotelImgUrl ?? ""),
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
                          Text(userHistory.hotelName ?? "", style: _boldText),
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
                          SizedBox(
                            width: 220,
                            child: Text(
                              userHistory.hotelAddress ?? "",
                              style: _normalText,
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
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: _tDecoration,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("Room ${userHistory.roomId}", style: _boldText),
                      Text(userHistory.roomLevel ?? "", style: _normalText),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        'Total: ${userHistory.price! * 2 * 3} \$',
                        style: const TextStyle(
                          fontFamily: 'VNPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.5,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '${userHistory.checkOutDate!.difference(userHistory.checkInDate!).inDays.toString()} days',
                        style: _normalText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
            decoration: _tDecoration,
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
                    Text(
                      userHistory.checkInDate.toString(),
                      style: _normalText,
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
                    Text(
                      userHistory.checkOutDate.toString(),
                      style: _normalText,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

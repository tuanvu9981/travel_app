import 'package:flutter/material.dart';
import 'package:travel_app/models/booking-history.model.dart';
import 'package:travel_app/widgets/booking_history/booking_history_line.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({Key? key}) : super(key: key);

  @override
  BookingTabState createState() => BookingTabState();
}

class BookingTabState extends State<BookingTab> {
  final _sloganStyle = TextStyle(fontSize: 28.0, fontFamily: 'DancingScript');

  final history1 = History(
    hotelImgUrl: 'assets/images/hotel1.jpeg',
    hotelName: 'ShengWang Hotel',
    hotelAddress: '1234 Yunnan street, Renmin Avenue, Shanghai',
    roomId: '409',
    roomLevel: 'Luxury',
    price: 509,
    bookingDate: DateTime.parse('2023-01-20 20:18:04Z'),
    checkInDate: DateTime.parse('2023-01-23 09:30:01Z'),
    checkOutDate: DateTime.parse('2023-01-26 16:30:02Z'),
  );

  final history2 = History(
    hotelImgUrl: 'assets/images/hotel2.jpg',
    hotelName: 'Yoshida Hotel',
    hotelAddress: '87 Meiji street, Jidai Avenue, Chiba',
    roomId: '809',
    roomLevel: 'Economy',
    price: 200,
    bookingDate: DateTime.parse('2022-11-18 18:57:05Z'),
    checkInDate: DateTime.parse('2022-11-24 11:30:04Z'),
    checkOutDate: DateTime.parse('2022-11-28 18:00:09Z'),
  );

  @override
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
              BookingHistoryLine(userHistory: history1),
              const SizedBox(height: 12.5),
              BookingHistoryLine(userHistory: history2),
            ],
          ),
        ),
      ],
    );
  }
}

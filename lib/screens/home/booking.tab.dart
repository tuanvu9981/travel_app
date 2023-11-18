import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/apis/booking-history.api.dart';
import 'package:travel_app/models/booking-history.model.dart';
import 'package:travel_app/widgets/booking_history/booking_history_line.dart';

class BookingTab extends ConsumerStatefulWidget {
  const BookingTab({Key? key}) : super(key: key);

  @override
  BookingTabState createState() => BookingTabState();
}

class BookingTabState extends ConsumerState<BookingTab> {
  final _sloganStyle =
      const TextStyle(fontSize: 28.0, fontFamily: 'DancingScript');
  BookingHistory? bookingHistory;

  Future<void> _fetchUserBookingHistory() async {
    String? accessToken = await ref.read(authProvider).getCurrentAccessToken();
    BookingHistory? data = await BookingHistoryApi().getUserBookingHistory(
      accessToken!,
    );
    if (data == null) {
      // Unauthorized
      String? newAccessToken = await ref.read(authProvider).regenerateToken();
      BookingHistory? newData = await BookingHistoryApi().getUserBookingHistory(
        newAccessToken!,
      );
      setState(() {
        bookingHistory = newData;
      });
    }
    setState(() {
      bookingHistory = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUserBookingHistory();
  }

  Widget _buildLine(History history) {
    return Column(
      children: [
        const SizedBox(height: 12.5),
        BookingHistoryCard(userHistory: history),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
      child: bookingHistory == null || bookingHistory!.histories == null
          ? const Center(
              child: CircularProgressIndicator(color: Colors.lightBlue),
            )
          : bookingHistory!.histories!.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.haveNoHistory,
                    style: const TextStyle(
                      fontFamily: 'VNPro',
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                )
              : ListView(
                  // default of ListView: vertical
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            'Your booking history',
                            style: _sloganStyle,
                          ),
                          Icon(
                            Icons.history_edu_outlined,
                            size: 35.0,
                            color: Colors.lightGreen[300],
                          ),
                        ],
                      ),
                    ),
                    ...bookingHistory!.histories!
                        .map((e) => _buildLine(e))
                        .toList(),
                  ],
                ),
    );
  }
}

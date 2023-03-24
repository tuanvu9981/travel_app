import 'dart:convert';

import 'package:http/http.dart';
import 'package:travel_app/models/booking-history.model.dart';

import 'api.const.dart';

class BookingHistoryApi {
  final String endpoint = 'booking-history';

  Future<BookingHistory?> createUserBookingHistory(
    String accessToken,
  ) async {
    var response = await post(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $accessToken",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body)['data'];
      return BookingHistory.fromJson(mapData);
    }
    return null;
  }

  Future<BookingHistory?> getUserBookingHistory(
    String accessToken,
  ) async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $accessToken",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body)['data'];
      return BookingHistory.fromJson(mapData);
    }
    return null;
  }

  Future<BookingHistory?> addNewHistory(
    String accessToken,
    History newHistory,
  ) async {
    var response = await put(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $accessToken",
      },
      body: jsonEncode(newHistory.toJson()),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body)['data'];
      return BookingHistory.fromJson(mapData);
    }
    return null;
  }
}

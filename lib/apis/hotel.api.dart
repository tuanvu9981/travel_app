import 'package:http/http.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'api.const.dart';
import 'dart:convert';

class HotelApi {
  static String endpoint = 'hotel';
  static Future<Hotel?> getHotelById(id) async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/$id"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      final mapData = jsonDecode(response.body)['data'];
      return Hotel.fromJson(mapData);
    }
    return null;
  }

  static Future<Hotel?> updateHotelById(String id, Hotel newHotel) async {
    var response = await put(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/$id"),
      headers: ApiConst.headers,
      body: newHotel,
    );
    if (response.statusCode == 200) {
      final mapData = jsonDecode(response.body)['data'];
      return Hotel.fromJson(mapData);
    }
    return null;
  }
}

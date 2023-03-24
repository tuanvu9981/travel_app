import 'package:http/http.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'api.const.dart';
import 'dart:convert';

class HotelApi {
  String endpoint = 'hotel';
  Future<Hotel?> getHotelById(
    String id,
    String accessToken,
  ) async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/$id"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $accessToken",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body)['data'];
      return Hotel.fromJson(mapData);
    }
    return null;
  }

  Future<Hotel?> updateHotelById(
    String id,
    Hotel? newHotel,
    String accessToken,
  ) async {
    var response = await put(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/$id"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $accessToken",
      },
      body: jsonEncode(newHotel?.toJson()),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body)['data'];
      return Hotel.fromJson(mapData);
    }
    return null;
  }
}

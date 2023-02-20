import 'dart:convert';
import 'package:travel_app/models/destination.model.dart';
import 'package:http/http.dart';
import 'api.const.dart';

class DestinationApi {
  static String endpoint = 'destination';

  static Future<List<Destination>?> getTopDestinations() async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/top"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> mapData =
          jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
      List<Destination> destinations = mapData
          .map(
            (d) => Destination.fromJson(d),
          )
          .toList();
      return destinations;
    }
    return null;
  }

  static Future<List<Destination>?> getAllDestinations() async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/all"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> mapData =
          jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
      List<Destination> destinations = mapData
          .map(
            (d) => Destination.fromJson(d),
          )
          .toList();
      return destinations;
    }
    return null;
  }
}

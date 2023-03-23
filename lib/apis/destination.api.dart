import 'dart:convert';
import 'package:travel_app/models/destination.model.dart';
import 'package:http/http.dart';
import 'api.const.dart';

class DestinationApi {
  String endpoint = 'destination';

  Future<List<Destination>?> getTopDestinations(
    String accessToken,
  ) async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/top"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $accessToken",
      },
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

  Future<List<Destination>?> getAllDestinations(
    String accessToken,
  ) async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/all"),
      headers: {
        ...ApiConst.headers,
        "Authorization": "Bearer $accessToken",
      },
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

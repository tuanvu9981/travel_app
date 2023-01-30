import 'dart:convert';
import 'package:travel_app/models/destination.model.dart';
import 'package:http/http.dart';
import 'package:travel_app/models/food.model.dart';
import 'api.const.dart';

class DestinationApi {
  static String endpoint = '/destination';

  static Future<List<Destination>?> getTopDestinations() async {
    var response = await get(
      Uri.https(ApiConst.baseUrl, "$endpoint/top"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<Destination> destinations = jsonDecode(response.body).map(
        (d) => Destination.fromJson(d),
      );
      return destinations;
    }
    return null;
  }

  static Future<List<Destination>?> getAllDestinations() async {
    var response = await get(
      Uri.https(ApiConst.baseUrl, "$endpoint/all"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<Destination> destinations = jsonDecode(response.body).map(
        (d) => Destination.fromJson(d),
      );
      return destinations;
    }
    return null;
  }
}

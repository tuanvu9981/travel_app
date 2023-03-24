import '../models/food.model.dart';
import 'package:http/http.dart';
import 'api.const.dart';
import 'dart:convert';

class FoodApi {
  String endpoint = 'food';
  Future<List<Food>?> getFoodByDestinationId(
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
      List<Map<String, dynamic>> mapData =
          jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
      List<Food> foodList = mapData
          .map(
            (f) => Food.fromJson(f),
          )
          .toList();
      return foodList;
    }
    return null;
  }
}

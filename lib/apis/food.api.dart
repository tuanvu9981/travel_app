import '../models/food.model.dart';
import 'package:http/http.dart';
import 'api.const.dart';
import 'dart:convert';

class FoodApi {
  static String endpoint = 'food';
  static Future<List<Food>?> getFoodByDestinationId(id) async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/$id"),
      headers: ApiConst.headers,
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

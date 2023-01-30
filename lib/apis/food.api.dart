import '../models/food.model.dart';
import 'package:http/http.dart';
import 'api.const.dart';
import 'dart:convert';

class FoodApi {
  static String endpoint = '/food';
  static Future<List<Food>?> getFoodByDestinationId(id) async {
    var response = await get(
      Uri.https(ApiConst.baseUrl, "$endpoint/$id"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<Food> foodList = jsonDecode(response.body).map(
        (f) => Food.fromJson(f),
      );
      return foodList;
    }
    return null;
  }
}

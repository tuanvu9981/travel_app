import 'dart:convert';
import 'api.const.dart';
import 'package:http/http.dart';
import 'package:travel_app/models/discount.model.dart';

class DiscountApi {
  static String endpoint = "/discount";

  static Future<List<DiscountInfo>?> getTopDiscountInfos() async {
    var response = await get(
      Uri.https(ApiConst.baseUrl, "$endpoint/top"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<DiscountInfo> discountInfos = jsonDecode(response.body).map(
        (d) => DiscountInfo.fromJson(d),
      );
      return discountInfos;
    }
    return null;
  }

  static Future<List<DiscountInfo>?> getAllDiscountInfos() async {
    var response = await get(
      Uri.https(ApiConst.baseUrl, "$endpoint/all"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<DiscountInfo> discountInfos = jsonDecode(response.body).map(
        (d) => DiscountInfo.fromJson(d),
      );
      return discountInfos;
    }
    return null;
  }
}

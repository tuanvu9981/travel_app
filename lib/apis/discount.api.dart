import 'dart:convert';
import 'api.const.dart';
import 'package:http/http.dart';
import 'package:travel_app/models/discount.model.dart';

class DiscountApi {
  static String endpoint = "discount-info";

  static Future<List<DiscountInfo>?> getTopDiscountInfos() async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/top"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> mapData =
          jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
      List<DiscountInfo> discountInfos = mapData
          .map(
            (d) => DiscountInfo.fromJson(d),
          )
          .toList();
      return discountInfos;
    }
    return null;
  }

  static Future<List<DiscountInfo>?> getAllDiscountInfos() async {
    var response = await get(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/all"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> mapData =
          jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
      List<DiscountInfo> discountInfos = mapData
          .map(
            (d) => DiscountInfo.fromJson(d),
          )
          .toList();
      return discountInfos;
    }
    return null;
  }
}

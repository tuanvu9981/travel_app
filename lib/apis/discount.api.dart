import 'dart:convert';
import 'api.const.dart';
import 'package:http/http.dart';
import 'package:travel_app/models/discount.model.dart';

class DiscountApi {
  String endpoint = "discount-info";

  Future<List<DiscountInfo>?> getAllDiscountInfos(
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

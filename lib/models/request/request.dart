import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:travel_app/models/classify_result.dart';
import 'package:http/http.dart';

class TravelRequest {
  static Map<String, String> headers = {"Content-type": "application/json"};

  static ClassifyResult parseClassifyResult(String responseBody) {
    return json.decode(responseBody) as ClassifyResult;
  }

  static Future<String> getResult(
    String baseUrl,
    String path,
    String payload,
  ) async {
    final response = await post(
      Uri.http(baseUrl, path),
      headers: headers,
      body: payload,
    );
    if (response.statusCode == 200) {
      // return compute(parseClassifyResult, response.body);
      return response.body;
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else {
      throw Exception("Cannot get");
    }
  }
}

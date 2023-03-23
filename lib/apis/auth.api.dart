import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:travel_app/apis/storage.api.dart';
import 'package:travel_app/models/token.model.dart';
import 'package:travel_app/models/user.model.dart';
import 'api.const.dart';
import 'dart:convert';

final authProvider = Provider((ref) => AuthApi(storageApi: StorageApi()));
final userProvider = StateProvider<User?>((ref) => null);

class AuthApi {
  final StorageApi _storageApi;

  AuthApi({required StorageApi storageApi}) : _storageApi = storageApi;

  final String endpoint = 'auth';

  Future<String?> getCurrentAccessToken() async {
    return await _storageApi.getAccessToken();
  }

  Future<String?> getCurrentRefreshToken() async {
    return await _storageApi.getRefreshToken();
  }

  Future<User?> getProfile() async {
    String? accessToken = await _storageApi.getAccessToken();
    if (accessToken != null) {
      var response = await get(
        Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/profile"),
        headers: {
          ...ApiConst.headers,
          "Authorization": "Bearer $accessToken",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> mapData = jsonDecode(response.body)['user'];
        return User.fromJson(mapData);
      } else if (response.statusCode == 401) {
        // Access Token expired --> Regenerate both access token & refresh token
        final newAccessToken = await regenerateToken();
        if (newAccessToken != null) {
          var newResponse = await get(
            Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/profile"),
            headers: {
              ...ApiConst.headers,
              "Authorization": "Bearer $newAccessToken",
            },
          );
          if (newResponse.statusCode == 200) {
            Map<String, dynamic> newMapData =
                jsonDecode(newResponse.body)['user'];
            return User.fromJson(newMapData);
          }
        }
        return null;
      }
      return null;
    }
    return null;
  }

  // No need access token
  Future<bool> signUp(
    String? email,
    String? password,
    String? fullname,
  ) async {
    var response = await post(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/sign-up"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 201) {
      Map<String, dynamic> mapData = jsonDecode(response.body);
      final tokens = TokenType.fromJson(mapData);
      await _storageApi.setAccessToken(tokens.accessToken!);
      await _storageApi.setRefreshToken(tokens.refreshToken!);
      return true;
    }
    return false;
  }

  // No need access token
  Future<bool> signIn(
    String? email,
    String? password,
  ) async {
    var response = await post(
      Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/sign-in"),
      headers: ApiConst.headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body);
      final tokens = TokenType.fromJson(mapData);
      await _storageApi.setAccessToken(tokens.accessToken!);
      await _storageApi.setRefreshToken(tokens.refreshToken!);
      return true;
    }
    return false;
  }

  Future<bool> signOut() async {
    final accessToken = await _storageApi.getAccessToken();
    if (accessToken != null) {
      var response = await post(
        Uri.http(ApiConst.baseUrl, '/api/v1/$endpoint/log-out'),
        headers: {
          ...ApiConst.headers,
          "Authorization": "Bearer $accessToken",
        },
      );
      if (response.statusCode == 200) {
        await _storageApi.removeTokens();
        return true;
      } else if (response.statusCode == 401) {
        final newAccessToken = await regenerateToken();
        if (newAccessToken != null) {
          var newResponse = await post(
            Uri.http(ApiConst.baseUrl, '/api/v1/$endpoint/log-out'),
            headers: {
              ...ApiConst.headers,
              "Authorization": "Bearer $newAccessToken",
            },
          );
          return newResponse.statusCode == 200 ? true : false;
        }
        return false;
      }
      return false;
    }
    return false;
  }

  Future<String?> regenerateToken() async {
    String? refreshToken = await _storageApi.getRefreshToken();
    if (refreshToken != null) {
      var response = await post(
        Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/regenerate-tokens"),
        headers: {
          ...ApiConst.headers,
          "Authorization": "Bearer $refreshToken",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> mapData = jsonDecode(response.body);
        final tokens = TokenType.fromJson(mapData);
        await _storageApi.setAccessToken(tokens.accessToken!);
        await _storageApi.setRefreshToken(tokens.refreshToken!);
        return tokens.accessToken;
      }
    }
    return null;
  }
}

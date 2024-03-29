import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:travel_app/apis/storage.api.dart';
import 'package:travel_app/models/token.model.dart';
import 'package:travel_app/models/user.model.dart';

import 'api.const.dart';

final authProvider = Provider((ref) => AuthApi(storageApi: StorageApi()));
final userProvider = StateProvider<User?>(
  (ref) => User(
    id: "",
    email: "tuanvu@gmail.com",
    fullname: "Vũ Tuấn Đạt",
    avatarUrl:
        "https://firebasestorage.googleapis.com/v0/b/travel-app-f9548.appspot.com/o/NewYork%2Factivities%2Fnew-york-city-central.jpg?alt=media&token=3832dd13-e75e-4066-a874-fad045154993",
    role: "",
    phoneNumber: "070 5543 8769",
    birthday: "2000-01-09",
    money: 1832800,
    systemLanguage: "vi",
  ),
);

final mapLocaleProvider = StateProvider((ref) => {});

class UpdateResponse {
  int statusCode;
  String message;
  UpdateResponse({required this.statusCode, required this.message});
}

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

  Future<UpdateResponse?> updateEmail(String oldEmail, String newEmail) async {
    var updateReponse = UpdateResponse(
      statusCode: 200,
      message: "Update successfully!",
    );
    String? accessToken = await _storageApi.getAccessToken();
    if (accessToken != null) {
      var response = await put(
        Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/update-email"),
        headers: {
          ...ApiConst.headers,
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode({"oldEmail": oldEmail, "newEmail": newEmail}),
      );
      switch (response.statusCode) {
        case 200:
          return updateReponse;
        case 401:
          final newAccessToken = await regenerateToken();
          if (newAccessToken != null) {
            var newResponse = await put(
              Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/update-email"),
              headers: {
                ...ApiConst.headers,
                "Authorization": "Bearer $newAccessToken",
              },
              body: jsonEncode({"oldEmail": oldEmail, "newEmail": newEmail}),
            );
            switch (newResponse.statusCode) {
              case 200:
                return updateReponse;
              case 400:
                // Bad Request Exception
                return UpdateResponse(
                  statusCode: 400,
                  message: jsonDecode(newResponse.body)['message'],
                );
              default:
                return UpdateResponse(statusCode: -1, message: 'Unknown');
            }
          }
          return UpdateResponse(statusCode: -2, message: 'Access Token null');
        case 400:
          return UpdateResponse(
            statusCode: 400,
            message: jsonDecode(response.body)['message'],
          );
        default:
          return UpdateResponse(statusCode: -1, message: 'Unknown');
      }
    }
    return UpdateResponse(statusCode: -2, message: 'Access Token null');
  }

  Future<UpdateResponse?> updatePassword(String oldPw, String newPw) async {
    var updateReponse = UpdateResponse(
      statusCode: 200,
      message: "Update successfully!",
    );
    String? accessToken = await _storageApi.getAccessToken();
    if (accessToken != null) {
      var response = await put(
        Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/update-password"),
        headers: {
          ...ApiConst.headers,
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode({"oldPassword": oldPw, "newPassword": newPw}),
      );
      switch (response.statusCode) {
        case 200:
          return updateReponse;
        case 401:
          final newAccessToken = await regenerateToken();
          if (newAccessToken != null) {
            var newResponse = await put(
              Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/update-password"),
              headers: {
                ...ApiConst.headers,
                "Authorization": "Bearer $newAccessToken",
              },
              body: jsonEncode({"oldPassword": oldPw, "newPassword": newPw}),
            );
            switch (newResponse.statusCode) {
              case 200:
                return updateReponse;
              case 400:
                // Bad Request Exception
                return UpdateResponse(
                  statusCode: 400,
                  message: jsonDecode(newResponse.body)['message'],
                );
              default:
                return UpdateResponse(statusCode: -1, message: 'Unknown');
            }
          }
          return UpdateResponse(statusCode: -2, message: 'Access Token null');
        case 400:
          return UpdateResponse(
            statusCode: 400,
            message: jsonDecode(response.body)['message'],
          );
        default:
          return UpdateResponse(statusCode: -1, message: 'Unknown');
      }
    }
    return UpdateResponse(statusCode: -2, message: 'Access Token null');
  }

  Future<UpdateResponse?> updateGeneral(User newUser) async {
    var updateReponse = UpdateResponse(
      statusCode: 200,
      message: "Update successfully!",
    );
    String? accessToken = await _storageApi.getAccessToken();
    if (accessToken != null) {
      var response = await put(
        Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/update-general"),
        headers: {
          ...ApiConst.headers,
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(newUser),
      );
      switch (response.statusCode) {
        case 200:
          return updateReponse;
        case 401:
          final newAccessToken = await regenerateToken();
          if (newAccessToken != null) {
            var newResponse = await put(
              Uri.http(ApiConst.baseUrl, "/api/v1/$endpoint/update-general"),
              headers: {
                ...ApiConst.headers,
                "Authorization": "Bearer $newAccessToken",
              },
              body: jsonEncode(newUser),
            );
            switch (newResponse.statusCode) {
              case 200:
                return updateReponse;
              case 400:
                // Bad Request Exception
                return UpdateResponse(
                  statusCode: 400,
                  message: jsonDecode(newResponse.body)['message'],
                );
              default:
                return UpdateResponse(statusCode: -1, message: 'Unknown');
            }
          }
          return UpdateResponse(statusCode: -2, message: 'Access Token null');
        case 400:
          return UpdateResponse(
            statusCode: 400,
            message: jsonDecode(response.body)['message'],
          );
        default:
          return UpdateResponse(statusCode: -1, message: 'Unknown');
      }
    }
    return UpdateResponse(statusCode: -2, message: 'Access Token null');
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
      body: jsonEncode({
        "email": email,
        "password": password,
        "fullname": fullname,
      }),
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
      body: jsonEncode({"email": email, "password": password}),
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
      if (response.statusCode == 201) {
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
          return newResponse.statusCode == 201 ? true : false;
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

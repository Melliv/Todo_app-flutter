import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo_app_flutter/domain/fetch_response.dart';
import 'package:todo_app_flutter/domain/fetch_response_multible.dart';
import 'package:todo_app_flutter/utility/app_url.dart';
import 'package:todo_app_flutter/utility/shared_preference.dart';

abstract class BaseService {
  static Future<Map<String, String>> getHeaders() async {
    String jwt = await UserPreferences().getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + jwt
    };
  }

  static Future<FetchResponse> postE(String apiEndPoint, Object dto) async {
    Map<String, String> headers = await getHeaders();

    return await post(Uri.parse(AppUrl.baseUrl + apiEndPoint),
            body: jsonEncode(dto), headers: headers)
        .then(onValue)
        .catchError(onError);
  }

  static Future<FetchResponse> updateE(String apiEndPoint, Object dto) async {
    Map<String, String> headers = await getHeaders();

    return await put(Uri.parse(AppUrl.baseUrl + apiEndPoint),
            body: jsonEncode(dto), headers: headers)
        .then(onValueNoBody)
        .catchError(onError);
  }

  static Future<FetchResponse> getE(String apiEndPoint) async {
    Map<String, String> headers = await getHeaders();

    return await get(Uri.parse(AppUrl.baseUrl + apiEndPoint), headers: headers)
        .then(onValue)
        .catchError(onError);
  }

  static Future<FetchResponseMultible> getAllE(String apiEndPoint) async {
    Map<String, String> headers = await getHeaders();

    return await get(Uri.parse(AppUrl.baseUrl + apiEndPoint), headers: headers)
        .then(onValueMultible)
        .catchError(onError);
  }

  static Future<FetchResponse> deleteE(String apiEndPoint) async {
    Map<String, String> headers = await getHeaders();

    return await delete(Uri.parse(AppUrl.baseUrl + apiEndPoint),
            headers: headers)
        .then(onValueNoBody)
        .catchError(onError);
  }

  static FetchResponse onValue(Response response) {
    var result = FetchResponse(ok: true, statusCode: response.statusCode);
    result.data = jsonDecode(response.body);
    return result;
  }

  static FetchResponse onValueNoBody(Response response) {
    return FetchResponse(ok: true, statusCode: response.statusCode);
  }

  static FetchResponseMultible onValueMultible(Response response) {
    var result =
        FetchResponseMultible(ok: true, statusCode: response.statusCode);
    result.data = jsonDecode(response.body);
    return result;
  }

  static onError(error) {
    var result = FetchResponse(ok: false, statusCode: 0);
    result.messages = error;
    return result;
  }
}

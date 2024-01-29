import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fruit/api_service/api_service.dart';
import 'package:fruit/get_it/get_it_service.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

enum HttpMethods {
  get,
  post,
  put,
  delete,
  patch,
}

enum ApiAction {
  login,
}

extension ApiActionName on ApiAction {
  String get path {
    switch (this) {
      case ApiAction.login:
        return "/login";
    }
  }
}

enum HttpHeader { json, form, none }

extension HeaderValue on HttpHeader {
  Map<String, String> getHeader({bool withToken = true}) {
    Map<String, String> dict = {};
    switch (this) {
      case HttpHeader.json:
        dict = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          if (withToken) 'Authorization': 'Bearer ${getIt<ApiService>().token}',
        };
      case HttpHeader.form:
        dict = {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
          if (withToken) 'Authorization': 'Bearer ${getIt<ApiService>().token}',
        };
      case HttpHeader.none:
        dict = {};
    }
    return dict;
  }
}

int tryCount = 0;

class ApiClinet {
  static const String _baseUrl = "https://caretale-api-dev.icavemen.com";

  static Future<Result<dynamic>> connectApi(
      {HttpMethods httpMethod = HttpMethods.post,
      bool withToken = true,
      required ApiAction apiAction,
      HttpHeader header = HttpHeader.json,
      String? suffix,
      Map<String, dynamic>? parameter,
      List<Map<String, dynamic>>? listParameter}) async {
    final Uri apiUrl = Uri.parse('$_baseUrl/${apiAction.path}/${suffix ?? ''}');

    if (tryCount > 3) {
      return Result(
          model: null,
          errorMessage: "Http error: ${tryCount.toString()} try failed.");
    }

    Response? response;
    parameter?.removeWhere((key, value) =>
        value == null ||
        (value is String && value.isEmpty) ||
        (value is List && value.isEmpty));
    listParameter?.removeWhere((element) => element.isEmpty);
    switch (httpMethod) {
      case HttpMethods.get:
        response = await http.get(
          apiUrl,
          headers: header.getHeader(withToken: withToken),
        );
        break;
      case HttpMethods.post:
        response = await http.post(
          apiUrl,
          headers: header.getHeader(withToken: withToken),
          body: jsonEncode(parameter ?? listParameter),
        );

        break;
      case HttpMethods.put:
        response = await http.put(
          apiUrl,
          headers: header.getHeader(withToken: withToken),
          body: jsonEncode(parameter ?? listParameter),
        );
        break;
      case HttpMethods.delete:
        response = await http.delete(
          apiUrl,
          headers: header.getHeader(withToken: withToken),
          body: jsonEncode(parameter ?? listParameter),
        );
        break;

      case HttpMethods.patch:
        response = await http.patch(
          apiUrl,
          headers: header.getHeader(withToken: withToken),
          body: jsonEncode(parameter ?? listParameter),
        );

        break;
    }

    debugPrint(
        "ApiClinet:  request URL :$apiUrl  \nbody: ${jsonEncode(parameter ?? listParameter)}");

    debugPrint(
        "ApiClinet:  statusCode :${response.statusCode} \n body: ${response.body}");

    if (response.statusCode == 200) {
      tryCount = 0;

      if (apiAction == ApiAction.login) {
        getIt<ApiService>().token = json.decode(response.body)['token'];
      }

      return Result(
          model: response.body.isNotEmpty ? json.decode(response.body) : null,
          errorMessage: null);
    } else if (response.statusCode == 401) {
      tryCount++;
      await connectApi(
          httpMethod: HttpMethods.post,
          withToken: false,
          apiAction: ApiAction.login,
          header: HttpHeader.json,
          suffix: ApiAction.login.path,
          parameter: {
            "email": getIt<AppEnvironmentModel>().currentUser?.email,
            "password": getIt<AppEnvironmentModel>().currentUser?.password,
          });
      return await connectApi(
          httpMethod: httpMethod,
          withToken: withToken,
          apiAction: apiAction,
          header: header,
          suffix: suffix,
          parameter: parameter,
          listParameter: listParameter);
    } else {
      tryCount++;
      // call again
      await Future.delayed(const Duration(seconds: 1));
      return await connectApi(
          httpMethod: httpMethod,
          withToken: withToken,
          apiAction: apiAction,
          header: header,
          suffix: suffix,
          parameter: parameter,
          listParameter: listParameter);
    }
  }
}

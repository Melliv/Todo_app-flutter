import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_app_flutter/domain/login.dart';
import 'package:todo_app_flutter/domain/register.dart';
import 'package:todo_app_flutter/domain/user.dart';
import 'package:todo_app_flutter/utility/app_url.dart';
import 'package:todo_app_flutter/utility/shared_preference.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(Login login) async {
    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    return await post(
      Uri.parse(AppUrl.login),
      body: jsonEncode(login),
      headers: {'Content-Type': 'application/json'},
    ).then((response) {
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      return onValue(response);
    }).catchError(onError);
  }

  Future<Map<String, dynamic>> register(Register registerData) async {
    _loggedInStatus = Status.Registering;
    notifyListeners();

    return await post(
      Uri.parse(AppUrl.register),
      body: jsonEncode(registerData),
      headers: {'Content-Type': 'application/json'},
    ).then((response) {
      _loggedInStatus = Status.Registered;
      notifyListeners();
      return onValue(response);
    }).catchError(onError);
  }

  static Future<Map<String, dynamic>> onValue(Response response) async {
    var result;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      User authUser = User.fromJson(responseData);

      UserPreferences().saveUser(authUser);

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}

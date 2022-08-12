import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _accessToken;
  String? _refreshToken;
  String? _user_id;

  bool get isAuthenticated {
    return _accessToken != null && _refreshToken != null;
  }

  String? get userId {
    return _user_id;
  }

  String? get token {
    if (_accessToken != null && _user_id != null) {
      return _accessToken;
    }
    return null;
  }

  Future<void> _authenticate(
      String? username, String email, String password, String segment) async {
    var url =
        Uri.parse("https://tesla-hangout-app.herokuapp.com/v1/auth/$segment/");

    Map<String, String> customHeaders = {"content-type": "application/json"};
    try {
      final response = await http.post(
        url,
        headers: customHeaders,
        body: json.encode(
          {
            "username": username,
            "email": email,
            "password": password,
          },
        ),
      );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        //throw HttpException(responseData['error']['message']);
      }

      _accessToken = responseData['accessToken'];
      _refreshToken = responseData['refreshToken'];
      _user_id = responseData['localId'];
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'accessToken': _accessToken,
        'refreshToken': _refreshToken,
        'user_id': _user_id,
      });
      prefs.setString('userData', userData);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUp(String username, String email, String password) async {
    return _authenticate(username, email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(null, email, password, "signIn");
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    _accessToken = null;
    _refreshToken = null;
    _user_id = null;
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    try {
      final data = prefs.getString('userData');
      final extractedUserData =
          json.decode(data as String) as Map<String, dynamic>;

      _accessToken = extractedUserData['accessToken'];
      _refreshToken = extractedUserData['refreshToken'];
      _user_id = extractedUserData['user_id'];
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}

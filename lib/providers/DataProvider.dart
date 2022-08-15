import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hangout/Models/message.dart';
import 'package:hangout/Models/user.dart';

class DataProvider with ChangeNotifier {
  final String? _accessToken;
  final String? _user_id;
  String? _username;

  List<User> _users;
  List<User> _conversations;
  List<Message> _messages;

  List<User> get users {
    return _users;
  }

  String? get user_id {
    return _user_id;
  }

  String? get username {
    return _username;
  }

  List<User> get conversations {
    return _conversations;
  }

  List<Message> get messages {
    return _messages;
  }

  DataProvider(this._user_id, this._username, this._accessToken, this._users,
      this._messages, this._conversations);

  Future<bool> getConnection() async {
    try {
      var url = Uri.parse("https://www.google.com.gh");

      final response = await http.get(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getUsers() async {
    try {
      _users = [];
      var url = Uri.parse("http://localhost:3000/v1/users/");
      Map<String, String> customHeaders = {
        "content-type": "application/json",
        "Authorization": "Bearer $_accessToken"
      };

      final response = await http.get(
        url,
        headers: customHeaders,
      );

      final responseData = json.decode(response.body);

      // if (responseData['error'] != null) {
      //   throw HttpException(responseData['error']);
      // }
      responseData.forEach((element) {
        var user = User(element['user_id'], element['username']);
        if (user.user_id == _user_id) {
          _username = user.username;
          return;
        }
        _users.add(user);
      });
      getConversations();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void clearMessages() {
    _messages = [];
    notifyListeners();
  }

  Future<void> getMessages(String incomingId) async {
    var url = Uri.parse("http://localhost:3000/v1/messages/$incomingId");

    Map<String, String> customHeaders = {
      "content-type": "application/json",
      "Authorization": "Bearer $_accessToken"
    };

    final response = await http.post(
      url,
      headers: customHeaders,
      body: json.encode(
        {
          "outgoing_id": user_id,
          "incoming_id": incomingId,
        },
      ),
    );

    final responseData = json.decode(response.body);

    // if (responseData['error'] != null) {
    //   throw HttpException(responseData['error']);
    // }

    _messages = [];

    responseData.forEach((element) {
      var message = Message(element['msg_id'], element['incoming_id'],
          element['outgoing_id'], element['msg']);

      _messages.add(message);
    });
    notifyListeners();
  }

  Future<void> sendMessages(String msg, String incomingId) async {
    if (msg == '') {
      return;
    }
    var url = Uri.parse("http://localhost:3000/v1/messages/");

    Map<String, String> customHeaders = {
      "content-type": "application/json",
      "Authorization": "Bearer $_accessToken"
    };

    final response = await http.post(
      url,
      headers: customHeaders,
      body: json.encode(
        {
          "msg": msg,
          "outgoing_id": user_id,
          "incoming_id": incomingId,
        },
      ),
    );

    final responseData = json.decode(response.body);

    // if (responseData['error'] != null) {
    //   throw HttpException(responseData['error']);
    // }

    _messages = [];
    getMessages(incomingId);
  }

  Future<void> getConversations() async {
    try {
      var url = Uri.parse("http://localhost:3000/v1/messages/$user_id");

      Map<String, String> customHeaders = {
        "content-type": "application/json",
        "Authorization": "Bearer $_accessToken"
      };

      final response = await http.get(
        url,
        headers: customHeaders,
      );

      final responseData = json.decode(response.body);

      // if (responseData['error'] != null) {
      //   throw HttpException(responseData['error']);
      // }

      _conversations = [];
      for (var element in _users) {
        responseData.forEach((item) {
          if (element.user_id == item['user_id']) {
            conversations.add(element);
          }
        });
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
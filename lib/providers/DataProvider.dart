import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hangout/Models/message.dart';
import 'package:hangout/Models/user.dart';

class DataProvider with ChangeNotifier {
  final String? _accessToken;
  final String? _user_id;

  List<User> _users;
  List<User> _conversations;
  List<Message> _messages;

  List<User> get users {
    return _users;
  }

  String? get user_id {
    return _user_id;
  }

  List<User> get conversations {
    return _conversations;
  }

  List<Message> get messages {
    return _messages;
  }

  DataProvider(this._user_id, this._accessToken, this._users, this._messages,
      this._conversations);

  Future<void> getUsers() async {
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
    //   //throw HttpException(responseData['error']['message']);
    // }
    responseData.forEach((element) {
      var user = User(element['user_id'], element['username']);
      if (user.user_id == _user_id) {
        return;
      }
      _users.add(user);
    });
    notifyListeners();
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
    print(responseData);
    _messages = [];
    getMessages(incomingId);
  }

  Future<void> getConversations() async {
    getUsers();
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

    _conversations = [];
    for (var element in _users) {
      responseData.forEach((item) {
        if (element.user_id == item['user_id']) {
          conversations.add(element);
        }
      });
    }
    notifyListeners();
  }
}

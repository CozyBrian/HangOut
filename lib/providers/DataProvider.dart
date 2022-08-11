import 'package:flutter/material.dart';
import 'package:hangout/Models/message.dart';
import 'package:hangout/Models/user.dart';

class DataProvider with ChangeNotifier {
  final String? _accessToken;

  final List<User> _users;
  final List<Message> _messages;

  List<User> get users {
    return _users;
  }

  List<Message> get messages {
    return _messages;
  }

  DataProvider(this._accessToken, this._users, this._messages);
}

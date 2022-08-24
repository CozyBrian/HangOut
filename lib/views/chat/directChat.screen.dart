import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/widgets/Chat/ChatInputBar.dart';
import 'package:hangout/widgets/Chat/messageLIst.dart';
import 'package:hangout/widgets/Layout/ChatNavBar.dart';

class DirectChatScreen extends StatelessWidget {
  static String routeName = "/direct-chat";

  @override
  Widget build(BuildContext context) {
    final RouteArgs = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      body: Column(
        children: [
          ChatNavBar(user: RouteArgs),
          MessageList(),
          ChatInputBar(RouteArgs),
        ],
      ),
    );
  }
}

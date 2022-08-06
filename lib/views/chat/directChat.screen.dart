import 'package:flutter/material.dart';
import 'package:hangout/widgets/Layout/ChatNavBar.dart';

class DirectChatScreen extends StatelessWidget {
  static String routeName = "/direct-chat";

  @override
  Widget build(BuildContext context) {
    final RouteArgs = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: Container(
        child: Column(
          children: [ChatNavBar(title: RouteArgs)],
        ),
      ),
    );
  }
}

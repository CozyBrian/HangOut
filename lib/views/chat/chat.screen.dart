import 'package:flutter/material.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [TopNavBar(title: "Chats")],
    );
  }
}

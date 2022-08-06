import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  final String text;
  const ChatListTile(this.text);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue,
          ),
        ),
        title: Text(text),
        subtitle: const Text("Okay Messasge here"),
      ),
    );
  }
}

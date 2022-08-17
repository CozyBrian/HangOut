import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/views/chat/directChat.screen.dart';

class ChatListTile extends StatelessWidget {
  final User user;
  const ChatListTile(this.user);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DirectChatScreen.routeName, arguments: user);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(149, 157, 165, 0.2),
              blurRadius: 24,
              spreadRadius: 0,
              offset: Offset(
                0,
                8,
              ),
            ),
          ],
        ),
        child: ListTile(
          leading: Hero(
            tag: user.username,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  user.username[0],
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          title: Text(user.username),
          subtitle: const Text("Okay Messasge here"),
        ),
      ),
    );
  }
}

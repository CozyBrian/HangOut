import 'package:flutter/material.dart';
import 'package:hangout/widgets/Chat/ChatListTile.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';
import 'package:hangout/widgets/Layout/backImgae.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackGroundImage(image: "assets/images/home3.jpg"),
      Column(
        children: [
          const TopNavBar(title: "Chats"),
          Expanded(
            child: Container(
              width: 500,
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 14, bottom: 120),
                itemCount: 6,
                itemBuilder: ((context, index) => ChatListTile("Hello $index")),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

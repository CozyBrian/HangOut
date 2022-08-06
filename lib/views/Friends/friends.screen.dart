import 'package:flutter/material.dart';
import 'package:hangout/widgets/Friends/friendListTile.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';
import 'package:hangout/widgets/Layout/backImgae.dart';

class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackGroundImage(image: "assets/images/home2.jpg"),
      Column(
        children: [
          const TopNavBar(title: "Friends"),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 14),
                itemCount: 5,
                itemBuilder: ((context, index) => FriendListTile(
                      "Hello $index",
                    )),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

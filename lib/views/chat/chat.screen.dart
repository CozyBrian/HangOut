import 'package:flutter/material.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';
import 'package:hangout/widgets/Layout/backImgae.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackGroundImage(image: "assets/images/home3.jpg"),
      Column(
        children: [
          const TopNavBar(title: "Friends"),
          Expanded(
            child: Container(
              width: 500,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) => Text(
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

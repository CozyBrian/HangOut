import 'package:flutter/material.dart';
import 'package:hangout/widgets/Home/profile.widget.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:hangout/widgets/Layout/backImgae.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackGroundImage(image: "assets/images/home1.jpg"),
      Column(
        children: [
          const MainNavBar(title: "Hello Brian"),
          const SizedBox(height: 100),
          Expanded(
            child: PageView.builder(
              itemCount: 4,
              //controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                    scale: i == _index ? 1 : 0.9, child: Profile());
              },
            ),
          )
        ],
      ),
    ]);
  }
}

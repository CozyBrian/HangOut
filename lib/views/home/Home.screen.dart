import 'package:flutter/material.dart';
import 'package:hangout/widgets/Home/profile.widget.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Column(
        children: [
          const TopNavBar(title: "Hello Brian"),
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

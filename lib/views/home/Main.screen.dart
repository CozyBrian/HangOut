import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:hangout/views/home/Home.screen.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/Main-Screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  List<String> images = [
    "assets/images/home1.jpg",
    "assets/images/home2.jpg",
    "assets/images/home3.jpg",
  ];

  void _handleIndexChanged(int value) {
    setState(() {
      _selectedTab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        HomeScreen(),
      ]),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _selectedTab,
        onTap: _handleIndexChanged,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            selectedColor: Colors.pink,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(Icons.chat_bubble),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

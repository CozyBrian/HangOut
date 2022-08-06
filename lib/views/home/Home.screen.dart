import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/Main-Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  List<String> images = [
    "images/home1.jpg",
    "images/home2.jpg",
    "images/home3.jpg",
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
        Positioned.fill(
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(
              images[_selectedTab],
            ),
          ),
        ),
        const Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: Text(
                "",
              ),
            ),
          ),
        ),
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

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
      body: Stack(fit: StackFit.expand, children: [
        Positioned.fill(
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(
              images[_selectedTab],
            ),
          ),
        ),
        Column(
          children: [
            SafeArea(
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
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

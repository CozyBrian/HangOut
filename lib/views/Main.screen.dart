import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:hangout/views/Friends/friends.screen.dart';
import 'package:hangout/views/chat/chat.screen.dart';
import 'package:hangout/views/home/Home.screen.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/Main-Screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  List<Widget> screens = [
    HomeScreen(),
    FriendsScreen(),
    ChatScreen(),
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
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
          transitionType: SharedAxisTransitionType.horizontal,
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: screens[_selectedTab],
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _selectedTab,
        onTap: _handleIndexChanged,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: Theme.of(context).primaryColor,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            selectedColor: Theme.of(context).primaryColor,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(Icons.chat_bubble),
            selectedColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

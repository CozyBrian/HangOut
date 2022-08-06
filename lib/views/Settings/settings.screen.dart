import 'package:flutter/material.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          MainNavBar(
            title: "Settings",
            isDark: true,
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

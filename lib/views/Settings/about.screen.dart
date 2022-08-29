import 'package:flutter/material.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static const routeName = "/about-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Column(
        children: const [
          TopNavBar(title: 'About'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                "Hangout is a platform that connects you with other people. We provide and always strive to improve ways for you to communicate with other hangout users through messages.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SafeArea(
            top: false,
            bottom: true,
            child: Text(
              "Hangout v1.0.0",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}

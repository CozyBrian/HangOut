import 'package:flutter/material.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';

class FriendDetailScreen extends StatelessWidget {
  static String routeName = "/friend-detail";

  @override
  Widget build(BuildContext context) {
    final RouteArgs = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      body: Container(
        child: Column(
          children: const [TopNavBar(title: "Hello")],
        ),
      ),
    );
  }
}

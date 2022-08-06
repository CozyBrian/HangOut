import 'package:flutter/material.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';

class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [TopNavBar(title: "Friends")],
    );
  }
}

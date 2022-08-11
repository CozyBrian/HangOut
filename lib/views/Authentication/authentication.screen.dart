import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

import 'login.dart';
import 'sign-up.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();

  static String routeName = "/Auth-Screen";
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late final TabContainerController _controller;

  @override
  void initState() {
    _controller = TabContainerController(length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 500,
                  child: TabContainer(
                      radius: 10,
                      color: const Color.fromARGB(15, 0, 0, 0),
                      selectedTextStyle: const TextStyle(fontSize: 20),
                      unselectedTextStyle: const TextStyle(fontSize: 15),
                      controller: _controller,
                      tabs: const ["login", "signup"],
                      children: [LoginView(), SignUpView()]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

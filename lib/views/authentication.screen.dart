import 'package:flutter/material.dart';
import 'package:hangout/views/Authentication/login.dart';
import 'package:hangout/views/Authentication/sign-up.dart';
import 'package:tab_container/tab_container.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
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
                  height: 600,
                  child: TabContainer(
                      controller: _controller,
                      tabs: const ["signup", "login"],
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

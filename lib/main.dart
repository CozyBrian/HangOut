import 'package:flutter/material.dart';
import 'package:hangout/views/home/Main.screen.dart';
import './views/Authentication/authentication.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AuthenticationScreen(),
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
      },
    );
  }
}

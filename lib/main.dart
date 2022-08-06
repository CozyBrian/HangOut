import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangout/views/Friends/friendDetails.screen.dart';
import 'package:hangout/views/Main.screen.dart';
import 'package:hangout/views/Settings/settings.screen.dart';
import 'package:hangout/views/chat/directChat.screen.dart';
import './views/Authentication/authentication.screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // Color for Android
      statusBarBrightness:
          Brightness.light // Dark == white status bar -- for IOS.
      ));
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
        FriendDetailScreen.routeName: (context) => FriendDetailScreen(),
        DirectChatScreen.routeName: (context) => DirectChatScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
      },
    );
  }
}

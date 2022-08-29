import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/providers/AuthProvider.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/views/Authentication/splash-screen.dart';
import 'package:hangout/views/Friends/friendDetails.screen.dart';
import 'package:hangout/views/Main.screen.dart';
import 'package:hangout/views/Settings/about.screen.dart';
import 'package:hangout/views/Settings/account.screen.dart';
import 'package:hangout/views/Settings/settings.screen.dart';
import 'package:hangout/views/chat/directChat.screen.dart';
import 'package:hangout/views/profile/profile-details.dart';
import 'package:provider/provider.dart';
import './views/Authentication/authentication.screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness:
          Brightness.light // Dark == white status bar -- for IOS.
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: AuthProvider()),
          ChangeNotifierProxyProvider<AuthProvider, DataProvider>(
            create: (_) =>
                DataProvider(User("", " ", "", ""), '', '', '', [], [], [], []),
            update: ((context, auth, previous) => DataProvider(
                  previous!.user,
                  auth.userId,
                  previous.username,
                  auth.token,
                  previous.users,
                  previous.friends,
                  previous.messages,
                  previous.conversations,
                )),
          ),
        ],
        child: Consumer<AuthProvider>(
          builder: (context, auth, _) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: auth.isAuthenticated
                ? MainScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: ((context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : AuthenticationScreen();
                    }),
                  ),
            routes: {
              MainScreen.routeName: (context) => MainScreen(),
              UserProfileScreen.routeName: (context) => UserProfileScreen(),
              FriendDetailScreen.routeName: (context) => FriendDetailScreen(),
              DirectChatScreen.routeName: (context) => DirectChatScreen(),
              SettingsScreen.routeName: (context) => SettingsScreen(),
              AboutScreen.routeName: (context) => const AboutScreen(),
              AccountScreen.routeName: (context) => const AccountScreen(),
            },
          ),
        ));
  }
}

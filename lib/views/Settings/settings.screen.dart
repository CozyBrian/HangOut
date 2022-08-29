import 'package:flutter/material.dart';
import 'package:hangout/views/Settings/about.screen.dart';
import 'package:hangout/views/Settings/account.screen.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:hangout/widgets/settings/settingsTile.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainNavBar(
            title: "Settings",
            isDark: true,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: const [
                SettingsTile(
                  title: "Account",
                  icon: Icons.person,
                  routeName: AccountScreen.routeName,
                ),
                SettingsTile(
                  title: "About",
                  icon: Icons.question_mark,
                  routeName: AboutScreen.routeName,
                ),
              ],
            ),
          ),
          const SafeArea(
            top: false,
            bottom: true,
            child: Text(
              "Hangout v1.0.0",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

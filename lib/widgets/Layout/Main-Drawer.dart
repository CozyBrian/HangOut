import 'package:flutter/material.dart';
import 'package:hangout/providers/AuthProvider.dart';
import 'package:hangout/views/Main.screen.dart';
import 'package:hangout/views/Settings/settings.screen.dart';
import 'package:hangout/views/profile/profile-details.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SafeArea(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: const Center(
                    child: Text(
                      "H A N G O U T",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              //const Divider(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(MainScreen.routeName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(UserProfileScreen.routeName);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SettingsScreen.routeName);
                },
              ),
            ],
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Center(
                child: ListTile(
                  leading: const Icon(Icons.door_back_door),
                  title: const Text("LogOut"),
                  onTap: () {
                    data.logOut();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

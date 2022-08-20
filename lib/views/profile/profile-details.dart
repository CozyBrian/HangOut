import 'package:flutter/material.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = "/user-profile-screen";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataProvider>(context).user;

    return Scaffold(
      body: Column(
        children: [
          const MainNavBar(
            title: "Profile",
            isDark: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(200),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 12,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            4,
                          ),
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      user.username[0],
                      style:
                          const TextStyle(fontSize: 100, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user.username,
                  style: const TextStyle(fontSize: 18),
                ),
                const Divider(),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Username"),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if ((value as String).isEmpty) {
                            return "Please enter a value.";
                          }
                          return null;
                        },
                        onFieldSubmitted: ((value) {}),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "About"),
                        maxLines: 3,
                        minLines: 3,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if ((value as String).isEmpty) {
                            return "Please enter a value.";
                          }
                          return null;
                        },
                        onFieldSubmitted: ((value) {}),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

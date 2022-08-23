import 'package:flutter/material.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:hangout/widgets/profile/profile-avatar.dart';
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
                GestureDetector(
                  child: ProfileAvatar(user: user),
                  onTap: () {
                    print("tapped");
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  user.username,
                  style: const TextStyle(fontSize: 18),
                ),
                const Divider(),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      Container(
                        width: 120,
                        margin: const EdgeInsets.only(top: 28),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 245, 187, 255),
                        ),
                        child: TextButton(
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

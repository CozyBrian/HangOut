import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/views/chat/directChat.screen.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';
import 'package:hangout/widgets/profile/profile-avatar.dart';
import 'package:provider/provider.dart';

class FriendDetailScreen extends StatelessWidget {
  static String routeName = "/friend-detail";

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TopNavBar(title: user.username),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Hero(
                          tag: user.user_id,
                          child: ProfileAvatar(
                            user: user,
                          )),
                      const SizedBox(height: 10),
                      Text(
                        user.username,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        width: 250,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 245, 187, 255)),
                                child: TextButton(
                                  child: const Text(
                                    "Chat",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        DirectChatScreen.routeName,
                                        arguments: user);
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 245, 187, 255),
                                ),
                                child: TextButton(
                                  child: const Text(
                                    "Add Friend",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<DataProvider>(context,
                                            listen: false)
                                        .addFriend(user.user_id)
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.purple,
                                          content: Text(
                                              '${user.username} has been added to friends.'),
                                        ),
                                      );
                                    });
                                  },
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(children: const []),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "About",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Culpa ex commodo id cupidatat minim. Laborum occaecat anim deserunt proident cillum duis mollit consequat in qui officia aute officia. Veniam quis et velit id in aliquip adipisicing culpa. Nostrud cillum mollit sit culpa duis.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

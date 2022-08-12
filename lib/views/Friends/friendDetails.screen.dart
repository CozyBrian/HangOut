import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/views/chat/directChat.screen.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';

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
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user.username,
                  style: const TextStyle(fontSize: 18),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "About",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Culpa ex commodo id cupidatat minim. Laborum occaecat anim deserunt proident cillum duis mollit consequat in qui officia aute officia. Veniam quis et velit id in aliquip adipisicing culpa. Nostrud cillum mollit sit culpa duis.",
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                DirectChatScreen.routeName,
                                arguments: user);
                          },
                          child: const Text('Chat'))
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

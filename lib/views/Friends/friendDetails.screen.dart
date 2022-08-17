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
                Hero(
                  tag: user.user_id,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
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

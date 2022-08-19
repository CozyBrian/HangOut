import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/views/Friends/friendDetails.screen.dart';

class Profile extends StatelessWidget {
  final User user;
  const Profile(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(FriendDetailScreen.routeName, arguments: user);
          },
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(149, 157, 165, 0.2),
                  blurRadius: 24,
                  spreadRadius: 0,
                  offset: Offset(
                    0,
                    8,
                  ),
                ),
              ],
            ),
            child: Column(
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
                const SizedBox(height: 20),
                Text(
                  user.username,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

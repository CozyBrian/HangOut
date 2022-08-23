import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/views/Friends/friendDetails.screen.dart';
import 'package:hangout/widgets/profile/profile-avatar.dart';

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
                    child: ProfileAvatar(
                      user: user,
                    )),
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

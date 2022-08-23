import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';

class ProfileAvatar extends StatelessWidget {
  User user;
  ProfileAvatar({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          style: const TextStyle(fontSize: 100, color: Colors.white),
        ),
      ),
    );
  }
}

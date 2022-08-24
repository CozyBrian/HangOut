import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';

class ProfileAvatar extends StatelessWidget {
  User user;
  File? image;
  ProfileAvatar({required this.user, this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 125,
      backgroundImage:
          user.profileImage != null ? NetworkImage(user.profileImage!) : null,
      child: user.profileImage != null
          ? null
          : Center(
              child: Text(
                user.username[0],
                style: const TextStyle(fontSize: 100, color: Colors.white),
              ),
            ),
    );
  }
}

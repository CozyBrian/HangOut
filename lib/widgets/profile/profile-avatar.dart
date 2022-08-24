import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';

class ProfileAvatar extends StatelessWidget {
  User user;
  File? image;
  ProfileAvatar({
    required this.user,
    this.image,
  });

  ImageProvider<Object>? myImage() {
    if (image != null) {
      return FileImage(image!);
    } else {
      if (user.profileImage != null) {
        return NetworkImage(user.profileImage!);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 125,
      backgroundImage: myImage(),
      child: myImage() != null
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

import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:provider/provider.dart';

class ChatNavBar extends StatelessWidget {
  final User user;
  const ChatNavBar({required this.user});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    data.clearMessages();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                Hero(
                  tag: user.username,
                  child: CircleAvatar(
                    radius: 17.5,
                    backgroundImage: user.profileImage != null
                        ? NetworkImage(user.profileImage!)
                        : null,
                    child: user.profileImage != null
                        ? null
                        : Center(
                            child: Text(
                              user.username[0],
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    width: double.infinity,
                    child: Text(
                      user.username,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
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

import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:provider/provider.dart';

class ChatInputBar extends StatelessWidget {
  final User user;
  ChatInputBar(this.user);
  final textBoxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: false);
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(103, 214, 214, 214),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                style: const TextStyle(fontSize: 18),
                cursorColor: Colors.black,
                controller: textBoxController,
                decoration: const InputDecoration(
                  hintText: "Send a Message",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              data.sendMessages(textBoxController.text, user.user_id).then((_) {
                textBoxController.clear();
              });
            },
            icon: Icon(
              Icons.send,
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]),
      ),
    );
  }
}

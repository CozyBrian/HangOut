import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              child: const TextField(
                style: TextStyle(fontSize: 18),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Send a Message",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
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

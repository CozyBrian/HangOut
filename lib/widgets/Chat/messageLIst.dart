import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  bool sender(int i) {
    return i % 2 == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 216, 216, 216),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 14, bottom: 120),
          itemCount: 5,
          itemBuilder: ((context, index) => BubbleNormal(
                text: 'Hello $index',
                isSender: sender(index),
                color: sender(index)
                    ? Theme.of(context).primaryColor
                    : const Color(0xFFE8E8EE),
                tail: true,
                textStyle: TextStyle(
                  fontSize: 16,
                  color: sender(index) ? Colors.white : Colors.black,
                ),
              )),
        ),
      ),
    );
  }
}

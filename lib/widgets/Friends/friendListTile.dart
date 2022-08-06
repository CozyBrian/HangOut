import 'package:flutter/material.dart';

class FriendListTile extends StatelessWidget {
  final String text;
  const FriendListTile(this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    const Text("This is just a stasus"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
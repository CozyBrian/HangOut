import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.green,
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
        ),
        const SizedBox(height: 10),
        const Text(
          "Constantine",
          style: TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    );
  }
}

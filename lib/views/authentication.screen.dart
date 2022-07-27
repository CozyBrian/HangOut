import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("HangOut"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("authentication"),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: const Text("HEllo"),
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.amber,
              child: TextButton(
                style: TextButton.styleFrom(),
                onPressed: () {}, 
                child: const Text("HEllo", style: TextStyle(color: Colors.white),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

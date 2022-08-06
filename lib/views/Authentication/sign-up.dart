import 'package:flutter/material.dart';
import 'package:hangout/views/Main.screen.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "SIGN UP",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.purple),
            ),
            child: const TextField(
              style: TextStyle(fontSize: 20),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Username",
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.purple),
            ),
            child: const TextField(
              style: TextStyle(fontSize: 20),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                icon: Icon(Icons.mail),
                hintText: "Email",
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.purple)),
            child: const TextField(
              cursorColor: Colors.black,
              style: TextStyle(fontSize: 20),
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                hintText: "Password",
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(MainScreen.routeName);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

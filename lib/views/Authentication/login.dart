import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "LOGIN",
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
              onPressed: () {},
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
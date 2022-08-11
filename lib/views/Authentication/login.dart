import 'package:flutter/material.dart';
import 'package:hangout/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  var _isLoading = false;

  Future<void> _Submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      Provider.of<AuthProvider>(context, listen: false).login(
          _emailTextController.text.trim(),
          _passwordTextController.text.trim());
    } catch (e) {
      //print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

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
            child: TextField(
              style: const TextStyle(fontSize: 20),
              cursorColor: Colors.black,
              controller: _emailTextController,
              decoration: const InputDecoration(
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
            child: TextField(
              cursorColor: Colors.black,
              style: const TextStyle(fontSize: 20),
              obscureText: true,
              controller: _passwordTextController,
              decoration: const InputDecoration(
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
              onPressed: () => _Submit(),
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

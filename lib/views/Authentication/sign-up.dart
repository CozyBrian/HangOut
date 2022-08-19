import 'package:flutter/material.dart';
import 'package:hangout/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _usernameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
    'username': '',
    'email': '',
    'password': '',
  };

  var _isLoading = false;

  Future<void> _Submit() async {
    final form = _formKey.currentState;
    if (form != null && !form.validate()) {
      // Invalid!
      return;
    }

    form?.save();

    setState(() {
      _isLoading = true;
    });

    Provider.of<AuthProvider>(context, listen: false)
        .signUp(_authData['username'] as String, _authData['email'] as String,
            _authData['password'] as String)
        .catchError((error) {
      print(error);
      var errorMessage = 'Authentication failed!';
      if (error.toString().contains('Connection refused')) {
        errorMessage = 'Client is Offline!';
      } else if (error.toString().contains("EMAIL_ALREADY_EXISTS")) {
        errorMessage = "User with email already exists.";
      }
      _showErrorDialog(errorMessage);
    }).then((value) {
      setState(() {
        _isLoading = false;
      });
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
            child: TextFormField(
              style: const TextStyle(fontSize: 20),
              cursorColor: Colors.black,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Username cannot be empty!';
                }
                return null;
              },
              onSaved: (value) {
                _authData['username'] = value!;
              },
              decoration: const InputDecoration(
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
            child: TextFormField(
              style: const TextStyle(fontSize: 20),
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Invalid email!';
                }
                return null;
              },
              onSaved: (value) {
                _authData['email'] = value!;
              },
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
            child: TextFormField(
              cursorColor: Colors.black,
              style: const TextStyle(fontSize: 20),
              obscureText: true,
              controller: _passwordTextController,
              validator: (value) {
                if (value!.isEmpty || value.length < 5) {
                  return 'Password is too short!';
                }
                return null;
              },
              onSaved: (value) {
                _authData['password'] = value!;
              },
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
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: ((ctx) => AlertDialog(
            title: const Text("An error occurred"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Okay"),
              ),
            ],
          )),
    );
  }
}

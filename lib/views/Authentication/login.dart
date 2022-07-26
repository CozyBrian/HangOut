import 'package:flutter/material.dart';
import 'package:hangout/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
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
        .login(
      _authData['email'] as String,
      _authData['password'] as String,
    )
        .catchError((error) {
      var errorMessage = 'Authentication failed!';
      if (error.toString().contains('WRONG_PASSWORD')) {
        errorMessage = 'Invalid Password!';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
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
      child: Form(
        key: _formKey,
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
                        "Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
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

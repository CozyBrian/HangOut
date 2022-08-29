import 'package:flutter/material.dart';
import 'package:hangout/providers/AuthProvider.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/widgets/Layout/Main-Drawer.dart';
import 'package:hangout/widgets/Layout/TopNavBar.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const routeName = '/account-screen';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context).user;
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      drawer: MainDrawer(),
      body: Column(children: [
        const TopNavBar(
          title: "Account",
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
            children: [
              ListTile(
                title: const Text("Username"),
                trailing: Text(data.username),
              ),
              ListTile(
                title: const Text("Unique ID"),
                trailing: Text(data.user_id),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  auth.logOut();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

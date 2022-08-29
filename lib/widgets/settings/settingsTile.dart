import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;
  const SettingsTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, routeName),
        title: Text(title),
        leading: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Icon(icon),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

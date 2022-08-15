import 'package:flutter/material.dart';

class OfflineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.warning,
              color: Colors.purple,
              size: 100,
            ),
            Text('Can\'t load data right now!'),
          ],
        ),
      ),
    );
  }
}

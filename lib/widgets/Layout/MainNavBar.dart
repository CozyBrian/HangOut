import 'package:flutter/material.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:provider/provider.dart';

class MainNavBar extends StatelessWidget {
  final String title;
  final bool isDark;
  final bool isHome;
  const MainNavBar(
      {required this.title, this.isDark = false, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    width: double.infinity,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: isDark ? Colors.black : Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                if (isHome)
                  IconButton(
                    onPressed: () {
                      Provider.of<DataProvider>(context, listen: false)
                          .getRandomUsers();
                    },
                    icon: Icon(
                      Icons.refresh,
                      size: 30,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                    color: isDark ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

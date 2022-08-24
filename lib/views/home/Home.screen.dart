import 'package:flutter/material.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/widgets/Home/profile.widget.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:hangout/widgets/Layout/backImgae.dart';
import 'package:hangout/widgets/Layout/offline.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  var _isInit = true;
  var _isOffline = false;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context).getUserDetails();
      Provider.of<DataProvider>(context).getUsers().then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((e) {
        setState(() {
          _isOffline = true;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Stack(children: [
      const BackGroundImage(image: "assets/images/home1.jpg"),
      Column(
        children: [
          MainNavBar(
            title: "Hello ${data.username}",
            isDark: true,
            isHome: true,
          ),
          if (!_isOffline) const SizedBox(height: 100),
          _isOffline
              ? OfflineView()
              : _isLoading
                  ? const CircularProgressIndicator.adaptive()
                  : Expanded(
                      child: PageView.builder(
                        itemCount: data.users.length,
                        //controller: PageController(viewportFraction: 0.7),
                        onPageChanged: (int index) =>
                            setState(() => _index = index),
                        itemBuilder: (_, i) {
                          return Transform.scale(
                            scale: i == _index ? 1 : 0.9,
                            child: Profile(data.users[i]),
                          );
                        },
                      ),
                    ),
        ],
      ),
    ]);
  }
}

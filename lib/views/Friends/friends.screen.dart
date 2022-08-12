import 'package:flutter/material.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/widgets/Friends/friendListTile.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:hangout/widgets/Layout/backImgae.dart';
import 'package:provider/provider.dart';

class FriendsScreen extends StatefulWidget {
  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  // var _isInit = true;
  // var _isLoading = false;

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<DataProvider>(context).getUsers().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context).users;
    return Stack(children: [
      const BackGroundImage(image: "assets/images/home2.jpg"),
      Column(
        children: [
          const MainNavBar(
            title: "Friends",
            isDark: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(103, 214, 214, 214),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const TextField(
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  iconColor: Colors.white,
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 14, bottom: 120),
                itemCount: data.length,
                itemBuilder: ((context, index) => FriendListTile(
                      data[index],
                    )),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

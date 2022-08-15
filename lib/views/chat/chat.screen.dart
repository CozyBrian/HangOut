import 'package:flutter/material.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:hangout/widgets/Chat/ChatListTile.dart';
import 'package:hangout/widgets/Layout/MainNavBar.dart';
import 'package:hangout/widgets/Layout/backImgae.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context).getConversations().then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((e) {});
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context).conversations;
    return Stack(children: [
      const BackGroundImage(image: "assets/images/home3.jpg"),
      Column(
        children: [
          const MainNavBar(
            title: "Chats",
            isDark: true,
          ),
          Expanded(
            child: SizedBox(
              width: 500,
              //color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 14, bottom: 120),
                itemCount: data.length,
                itemBuilder: ((context, index) => ChatListTile(data[index])),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

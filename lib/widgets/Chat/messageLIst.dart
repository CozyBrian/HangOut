import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:hangout/Models/user.dart';
import 'package:hangout/providers/DataProvider.dart';
import 'package:provider/provider.dart';

class MessageList extends StatefulWidget {
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context, listen: false)
          .getMessages(user.user_id)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    final data = Provider.of<DataProvider>(context).messages;
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 216, 216, 216),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 14, bottom: 120),
          itemCount: data.length,
          itemBuilder: ((context, index) => BubbleNormal(
                text: data[index].msg,
                isSender: data[index].outgoing_id != user.user_id,
                color: data[index].outgoing_id != user.user_id
                    ? Theme.of(context).primaryColor
                    : const Color(0xFFE8E8EE),
                tail: !(index < data.length - 1),
                textStyle: TextStyle(
                  fontSize: 16,
                  color: data[index].outgoing_id != user.user_id
                      ? Colors.white
                      : Colors.black,
                ),
              )),
        ),
      ),
    );
  }
}

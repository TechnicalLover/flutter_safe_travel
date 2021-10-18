import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GroupPage extends StatefulWidget {
  const GroupPage(this.setVisibleAppbar, {Key? key}) : super(key: key);

  final Function setVisibleAppbar;

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (t) {
        if (t is ScrollEndNotification) {
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            widget.setVisibleAppbar(true);
          }
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            widget.setVisibleAppbar(false);
          }
        }
        return true;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: 80,
              color: Colors.blue,
            ),
            Container(
              height: 80,
              color: Colors.green,
            ),
            Container(
              height: 80,
              color: Colors.yellow,
            ),
            Container(
              height: 80,
              color: Colors.green,
            ),
            Container(
              height: 80,
              color: Colors.white,
            ),
            Container(
              height: 80,
              color: Colors.black,
            ),
            Container(
              height: 80,
              color: Colors.purple,
            ),
            Container(
              height: 80,
              color: Colors.pink,
            ),
            Container(
              height: 80,
              color: Colors.red,
            ),
            Container(
              height: 80,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

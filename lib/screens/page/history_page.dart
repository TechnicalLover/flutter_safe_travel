import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:safetravel/screens/history_order/history_order_screen.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage(this.setVisibleAppbar, {Key? key}) : super(key: key);

  final Function setVisibleAppbar;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        child: const HistoryOrderScreen(),
      ),
    );
  }
}

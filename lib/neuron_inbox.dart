library neuroninbox;

import 'package:flutter/material.dart';
import 'inbox_layout.dart';
import 'model/model.dart';

class InboxPage extends StatefulWidget {
  final List<Data> dataListInbox;

  const InboxPage(
      {Key key,
        this.dataListInbox})
      : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InboxLayout(dataListInbox: widget.dataListInbox),
    );
  }
}

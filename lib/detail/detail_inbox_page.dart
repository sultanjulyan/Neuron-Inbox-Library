import 'package:flutter/material.dart';
import 'package:neuron_inbox/model/model.dart';

import 'detail_inbox_layout.dart';

class DetailInboxPage extends StatefulWidget {

  final Data itemListModel;
  DetailInboxPage({Key key, @required this.itemListModel}) : super(key: key);

  @override
  _DetailInboxPageState createState() => _DetailInboxPageState();
}

class _DetailInboxPageState extends State<DetailInboxPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailInboxLayout(itemListModel: widget.itemListModel),
    );
  }
}

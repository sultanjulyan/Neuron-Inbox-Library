import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neuron_inbox/component/component_navigations.dart';
import 'package:neuron_inbox/component/component_style_guides.dart';
import 'package:neuron_inbox/model/model.dart';

class DetailInboxLayout extends StatefulWidget {
  final Data itemListModel;
  DetailInboxLayout({Key key, @required this.itemListModel}) : super(key: key);

  @override
  _DetailInboxLayoutState createState() => _DetailInboxLayoutState();
}

class _DetailInboxLayoutState extends State<DetailInboxLayout> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    final _txtDateInbox = Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(widget.itemListModel.data4, style: TextStyled.body),
      ),
    );

    final _txtDetailInbox = Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.itemListModel.data2,
            style: TextStyled.title,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.itemListModel.data3,
            style: TextStyled.normalTitle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );

    final _cardDetailInbox = Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: _txtDetailInbox);

    final _scaffold = Scaffold(
      backgroundColor: ColorStyled.mySecondAlternativeColor,
      appBar: ComponentNavigations.defaultAppBar(
          context, 'Detail Inbox', null, null, true, null, null),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[_txtDateInbox, _cardDetailInbox],
        ),
      ),
    );

    return _scaffold;
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component_alerts.dart';
import 'component_style_guides.dart';

class ComponentNavigations {
  static defaultAppBar(
      BuildContext context,
      String title,
      List<Tab> tab,
      TabController tabController,
      bool leadingStatusActiveInactive,
      Widget leadingDestionationPage,
      dynamic actionsAppbar) {
    TabBar tabBar;
    Widget leading = Container();
    if (tab != null && tabController != null) {
      tabBar = TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 2),
        controller: tabController,
        tabs: tab,
        labelColor: ColorStyled.myPrimaryColor,
        indicatorColor: ColorStyled.myPrimaryColor,
        unselectedLabelColor: ColorStyled.myFirstAlternativeColor,
      );
    }
    if (leadingStatusActiveInactive == true) {
      leading = Container(
        width: 35,
        child: IconButton(
          iconSize: 16,
          alignment: Alignment.centerLeft,
          onPressed: () {
            Navigator.of(context).pop();
            if (leadingDestionationPage != null) {
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) =>
                      leadingDestionationPage));
            }
          },
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: ColorStyled.myPrimaryBody,
          ),
        ),
      );
    }

    AppBar appBar = AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            leading,
            Text(
              title,
              style: TextStyled.title,
            ),
          ],
        ),
        brightness: Brightness.dark,
        actions: actionsAppbar,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        bottom: tabBar);

    return appBar;
  }

  static navigationSquare(
      BuildContext context, List<Map<String, dynamic>> navigationSquareData) {
    _navigationList(int i) {
      dynamic onTapAction;
      if (navigationSquareData[i]['action'] != null ||
          navigationSquareData[i]['action'] != '') {
        if (navigationSquareData[i]['type'].toString().toLowerCase() ==
            'page') {
          onTapAction = () {
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) =>
                    navigationSquareData[i]['action']));
          };
        } else if (navigationSquareData[i]['type'].toString().toLowerCase() ==
            'method') {
          onTapAction = navigationSquareData[i]['action'];
        }
      } else {
        onTapAction = () {

        };
      }
      return Container(
        padding: i == 0
            ? EdgeInsets.only(left: LayoutStyled.paddingDefault)
            : i != navigationSquareData.length - 1
                ? EdgeInsets.only(left: 10)
                : EdgeInsets.only(left: 10, right: LayoutStyled.paddingDefault),
        child: Column(children: <Widget>[
          Container(
            child: new Material(
              child: new InkWell(
                customBorder: new CircleBorder(),
                onTap: onTapAction,
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  child: Icon(
                    navigationSquareData[i]['icon'], //Icon Menu
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.transparent,
            ),
            decoration: BoxDecoration(
              color: navigationSquareData[i]['color'], //Color Background
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 3),
          Container(
            width: 60.0,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: GestureDetector(
              onTap: onTapAction,
              child: Text(navigationSquareData[i]['title'], // Title Menu
                  style: TextStyled.caption,
                  textAlign: TextAlign.center),
            ),
          ),
        ]),
      );
    }

    Widget navigationList = Container(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: navigationSquareData.length,
        itemBuilder: (BuildContext context, int index) =>
            _navigationList(index),
      ),
    );

    return navigationList;
  }
}

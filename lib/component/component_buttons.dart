import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component_style_guides.dart';

class ComponentButtons {
  static primaryButton(
      bool buttonStatusActiveInactive,
      String textButton,
      bool iconStatusActiveInactive,
      IconData iconName,
      dynamic onPressedAction) {
    Widget iconComponent = Container();

    if (iconStatusActiveInactive == true) {
      if (iconName == null) {
        iconName = FontAwesomeIcons.questionCircle;
      } else {
        iconName = iconName;
      }

      iconComponent = Row(
        children: <Widget>[
          Icon(
            iconName,
            size: 14,
            color: Colors.white,
          ),
          SizedBox(width: 10)
        ],
      );
    }

    RaisedButton primaryButton = RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: buttonStatusActiveInactive == true ? 2.0 : 0,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              iconComponent,
              Text(
                textButton,
                style: TextStyled.whiteTitle,
              )
            ]),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        color: buttonStatusActiveInactive == true
            ? ColorStyled.myPrimaryColor
            : ColorStyled.myTertiaryBody,
        onPressed: buttonStatusActiveInactive == true ? onPressedAction : null);
    return primaryButton;
  }

  static secondaryButton(
      bool buttonStatusActiveInactive,
      String textButton,
      bool iconStatusActiveInactive,
      IconData iconName,
      dynamic onPressedAction) {
    Widget iconComponent = Container();

    if (iconStatusActiveInactive) {
      if (iconName == null) {
        iconName = FontAwesomeIcons.questionCircle;
      } else {
        iconName = iconName;
      }

      iconComponent = Row(
        children: <Widget>[
          Icon(
            iconName,
            size: 14,
            color: buttonStatusActiveInactive == true
                ? ColorStyled.myPrimaryColor
                : ColorStyled.myTertiaryBody,
          ),
          SizedBox(width: 10)
        ],
      );
    }

    OutlineButton secondaryButton = OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              iconComponent,
              Text(
                textButton,
                style: buttonStatusActiveInactive == true
                    ? TextStyled.redTitle
                    : TextStyled.grayTitle,
              )
            ]),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        color: Colors.transparent,
        highlightedBorderColor: buttonStatusActiveInactive == true
            ? ColorStyled.myPrimaryColor
            : ColorStyled.myTertiaryBody,
        borderSide: BorderSide(
            color: buttonStatusActiveInactive == true
                ? ColorStyled.myPrimaryColor
                : ColorStyled.myTertiaryBody,
            width: 1,
            style: BorderStyle.solid),
        onPressed: buttonStatusActiveInactive == true ? onPressedAction : null);

    return secondaryButton;
  }

  static tertiaryButton(String textButton, dynamic onPressedAction) {
    FlatButton tertiaryButton = FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(24.0),
      ),
      onPressed: onPressedAction,
      child: new Text(textButton, style: TextStyled.redTitle),
    );
    return tertiaryButton;
  }
}

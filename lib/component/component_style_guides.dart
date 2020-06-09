import 'package:flutter/material.dart';

class ColorStyled {
  // High Priority Color
  static const Color myPrimaryColor = Color(0xFFD40033);
  static const Color mySecondaryColor = Color(0xFFF59422);
  static const Color myPrimaryBody = Color(0xFF444444);
  static const Color mySecondaryBody = Color(0xFF666666);
  static const Color myTertiaryBody = Color(0xFF999999);
  static const Color myFirstAlternativeColor= Color(0xFFBBBBBB);
  static const Color mySecondAlternativeColor = Color(0xFFEEF2F3);
  static const Color myThirdAlternativeColor = Color(0xFFF7F8F9);
  static const Color myFourthAlternativeColor = Color(0xFFF0F0F0);
  // Low Priority Color
  static const Color myPurple = Color(0xFF9A206B);
  static const Color myDarkGreen = Color(0xFF087E8A);
  static const Color myLightGreen = Color(0xFF09CCC0);
  static const Color mySoftGreen = Color(0xFF6DD4D1);
  static const Color myLightRed = Color(0xFFFF395D);
  static const Color myDarkBlue = Color(0xFF225EA6);
  static const Color myLightBlue = Color(0xFF1889BA);
  static const Color mySoftBlue = Color(0xFF31C5F8); 
  static const Color myLightYellow = Color(0xFFFFD600);
  //Validation
  static const Color myValid = Color(0xFF43A047);
  static const Color myInvalid = Color(0xFFF44336);
}

class TextStyled {
  //Medium Weight
  static const headline = TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: ColorStyled.myTertiaryBody);
  static const display = TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: ColorStyled.myPrimaryColor );
  static const subhead = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ColorStyled.myPrimaryBody);
  static const title = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ColorStyled.myPrimaryBody);
  static const body = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: ColorStyled.myPrimaryBody);
  static const caption = TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: ColorStyled.myPrimaryBody);
  //Normal Weight
  static const normalSubhead = TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: ColorStyled.myPrimaryBody);
  static const normalTitle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorStyled.myPrimaryBody);
  static const normalBody = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: ColorStyled.myPrimaryBody);
  static const normalCaption = TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: ColorStyled.myPrimaryBody);
  //Gray Color
  static const lightText = TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: ColorStyled.myTertiaryBody);
  static const grayTitle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorStyled.myTertiaryBody);
  static const grayBody = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: ColorStyled.myTertiaryBody);
  //White Color
  static const whiteHeadline = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);
  static const whiteSubhead = TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white);
  static const whiteTitle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  static const whiteBody = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
  static const whiteBodyBold = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white);
  static const whiteCaption = TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white);
  //Red Color
  static const redTitle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorStyled.myPrimaryColor);
  static const redBody = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: ColorStyled.myPrimaryColor);
}

class LayoutStyled {
  static const double paddingDefault = 20.0;
  static const double marginDefault = 20.0;
  static const EdgeInsets paddingAllSide = EdgeInsets.all(paddingDefault);
  static const EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: paddingDefault);
  static const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal:paddingDefault);
  static const EdgeInsets paddingLeftOnly = EdgeInsets.only(left:paddingDefault);
  static const EdgeInsets paddingRightOnly = EdgeInsets.only(right:paddingDefault);
  static const EdgeInsets marginAllSide = EdgeInsets.all(marginDefault);
  static const EdgeInsets marginVertical = EdgeInsets.symmetric(vertical: marginDefault);
  static const EdgeInsets marginHorizontal = EdgeInsets.symmetric(horizontal:marginDefault);
  static const EdgeInsets marginLeftOnly = EdgeInsets.only(left:marginDefault);
  static const EdgeInsets marginRightOnly = EdgeInsets.only(right:marginDefault);
}
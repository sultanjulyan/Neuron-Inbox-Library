import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component_buttons.dart';
import 'component_style_guides.dart';

class ComponentAlerts {
  static alertDialogConfirmation(BuildContext context, String title,
      String contentMessage, dynamic onPressedActionTrue) {
    return showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyled.title,
                  ),
                  SizedBox(height: 10),
                  Text(contentMessage,
                      textAlign: TextAlign.center,
                      style: TextStyled.normalTitle),
                  SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    child: ComponentButtons.primaryButton(
                        true, 'Yes', false, null, onPressedActionTrue),
                  ),
                  Container(
                    child: Center(
                      child: FlatButton(
                        child: Text("No, maybe later",
                            style: TextStyled.grayTitle),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  static alertDialogSuccessFailed(
    BuildContext context,
    bool trueSuccessfalseFailed,
    String contentText,
    dynamic onPressedActionContinue,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
                trueSuccessfalseFailed == true
                    ? FontAwesomeIcons.checkCircle
                    : FontAwesomeIcons.timesCircle,
                size: 60,
                color: trueSuccessfalseFailed == true
                    ? ColorStyled.myLightGreen
                    : ColorStyled.myLightRed),
            SizedBox(height: 10),
            Text(
              trueSuccessfalseFailed == true
                  ? contentText + ' Succesful'
                  : contentText + ' Failed',
              style: TextStyled.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18),
            ComponentButtons.primaryButton(
                true, 'Continue', false, null, onPressedActionContinue)
          ],
        ),
      ),
    );
  }

  static alertDialogSuccessFailedWithText(
    BuildContext context,
    bool trueSuccessfalseFailed,
    String contentText,
    dynamic onPressedActionContinue,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
                trueSuccessfalseFailed == true
                    ? FontAwesomeIcons.checkCircle
                    : FontAwesomeIcons.timesCircle,
                size: 60,
                color: trueSuccessfalseFailed == true
                    ? ColorStyled.myLightGreen
                    : ColorStyled.myLightRed),
            SizedBox(height: 10),
            Text(
              contentText,
              style: TextStyled.normalTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18),
            ComponentButtons.primaryButton(
                true, 'Continue', false, null, onPressedActionContinue)
          ],
        ),
      ),
    );
  }

  static alertEmpty(BuildContext context) {
    Widget alertEmpty = Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Icon(
                FontAwesomeIcons.boxOpen,
                size: MediaQuery.of(context).size.width / 4,
                color: ColorStyled.mySecondaryBody,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Sorry, there's nothing here",
              style: TextStyled.subhead,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Please, try again or contact your administrator",
              style: TextStyled.normalTitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    return alertEmpty;
  }

  static alertForm(
    BuildContext context,
    Widget content,
    dynamic saveAction,
  ) {
    Widget buttonSubmit = Container(
      width: double.infinity,
      child: ComponentButtons.primaryButton(
          true, 'Submit', false, null, saveAction),
    );

    Widget buttonCancel = Container(
      child: Center(
        child: FlatButton(
          child: Text("Cancel", style: TextStyled.grayTitle),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => new AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[content, buttonSubmit, buttonCancel],
            ))));
  }
}

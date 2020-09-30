import 'package:flutter/material.dart';
import 'package:taskapp/screens/common_login_screen.dart';
import 'package:taskapp/shared/landing_text_style.dart';

class NotLoggedInScreen extends StatelessWidget {
  const NotLoggedInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileWidget = Container(
      alignment: Alignment.center,
      child: Text(
        'You are not logged in',
        style: landingTextStyle,
      ),
    );
    return buildLoginScreen(
      context,
      profileWidget: profileWidget,
      actionButtonText: 'Log in',
      actionButtonOnPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/', // could be a different route for login
          ModalRoute.withName('/'),
        );
      },
      enableEmail: false,
    );
  }
}

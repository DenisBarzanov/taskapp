import 'package:flutter/material.dart';

import 'common_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const profileHeight = 80.0;
    var lightTextStyle = TextStyle(color: Colors.grey[600]);
    var profileWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Avatar', style: lightTextStyle),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            children: [
              SizedBox(
                width: profileHeight,
                height: profileHeight,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.jpeg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  height: profileHeight,
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Selfie.png',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 10),
                      Text('Uploaded Feb 19 2020', style: lightTextStyle),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
    return buildLoginScreen(
      context,
      profileWidget: profileWidget,
      actionButtonText: 'Log out',
      actionButtonOnPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

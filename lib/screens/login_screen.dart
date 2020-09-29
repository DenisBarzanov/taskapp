import 'package:flutter/material.dart';
import 'package:taskapp/shared/text_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const profileHeight = 80.0;
    var lightTextStyle = TextStyle(color: Colors.grey[600]);
    return Theme(
      data: ThemeData(
          // primaryColor: Color(0x1c3760),
          ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          // leading: Container(),
          automaticallyImplyLeading: false,
          title: Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text('Email'),
              emailField,
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Password'),
              ),
              getPasswordField(enabled: false),
              FlatButton(
                textColor: Theme.of(context).buttonColor,
                child: Text('Change'),
                onPressed: () {},
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                      color: Theme.of(context).buttonColor,
                      textTheme: Theme.of(context).buttonTheme.textTheme,
                      child: Text('Logout'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taskapp/shared/landing_text_style.dart';
import 'package:taskapp/shared/text_fields.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );

    var grey = Color(0xff898c91);
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 40, top: 100),
              child: Text(
                'Welcome',
                style: landingTextStyle,
              ),
            ),
            Text('Email'),
            getEmailField(),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text('Password'),
            ),
            getPasswordField(withSuffix: true),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: FlatButton(
                shape: roundedRectangleBorder,
                color: Theme.of(context).buttonColor,
                // color: Color(0xFF4789f0),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text('Log in'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {},
                child: Text('Forgot Password'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Divider(
                    color: grey,
                    thickness: 1,
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'or',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Divider(
                    color: grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: OutlineButton(
                borderSide: BorderSide(
                  width: 1,
                  color: grey,
                ),
                shape: roundedRectangleBorder,
                onPressed: () {
                  Navigator.of(context).pushNamed('/not-logged-in');
                },
                child: Text(
                  'Explore The App',
                  style: TextStyle(color: grey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

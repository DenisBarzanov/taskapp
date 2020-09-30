import 'package:flutter/material.dart';
import 'package:taskapp/shared/login_navbar.dart';
import 'package:taskapp/shared/text_fields.dart';

Widget buildLoginScreen(
  BuildContext context, {
  @required Widget profileWidget,
  @required String actionButtonText,
  void Function() actionButtonOnPressed,
  bool enableEmail = true,
}) {
  return Scaffold(
    appBar: appBar(context),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 132),
            child: profileWidget,
          ),
          Text('Email'),
          getEmailField(enabled: enableEmail),
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
                  child: Text(actionButtonText),
                  onPressed: actionButtonOnPressed,
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
  );
}

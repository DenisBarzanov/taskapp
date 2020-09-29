import 'package:flutter/material.dart';

var inputDecoration = InputDecoration(
  isDense: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(style: BorderStyle.solid),
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
);
Widget getPasswordField({
  bool withSuffix = false,
  bool enabled = true,
}) {
  var passwordField = TextField(
    decoration: inputDecoration.copyWith(
      hintText: 'enter password',
      suffixIcon: withSuffix
          ? Icon(
              Icons.visibility_off,
            )
          : null,
      enabled: enabled,
      fillColor: !enabled ? Colors.grey[500] : null,
      filled: true,
    ),
    // readOnly: true,
  );
  return Opacity(
    opacity: enabled ? 1 : 0.5,
    child: passwordField,
  );
}

var emailField = TextField(
  decoration: inputDecoration.copyWith(hintText: 'e.g. johndoe@mail.com'),
);

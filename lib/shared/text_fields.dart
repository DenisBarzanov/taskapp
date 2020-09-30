import 'package:flutter/material.dart';

var inputDecoration = InputDecoration(
  isDense: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(style: BorderStyle.solid),
  ),
);

Widget getPasswordField({
  bool withSuffix = false,
  bool obscureText = false,
  void Function() obscureTextOnPressed,
  bool enabled = true,
  TextEditingController controller,
  String Function(String) validator,
}) {
  final decoration = inputDecoration.copyWith(
    hintText: 'enter password',
    suffixIcon: IconButton(
      onPressed: obscureTextOnPressed,
      icon: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        // color: Color(0xffbcc1c9),
      ),
    ),
    enabled: enabled,
    fillColor: !enabled ? Colors.grey[500] : null,
    filled: !enabled,
  );
  var passwordField = validator == null
      ? TextField(
          decoration: decoration,
          controller: controller,
          obscureText: obscureText,
        )
      : TextFormField(
          decoration: decoration,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          // textInputAction: TextInputAction.next,
        );
  return Opacity(
    opacity: enabled ? 1 : 0.5,
    child: passwordField,
  );
}

Widget getEmailField({
  bool enabled = true,
  TextEditingController controller,
  String Function(String) validator,
}) {
  final decoration = inputDecoration.copyWith(
    hintText: 'e.g. johndoe@mail.com',
    enabled: enabled,
    fillColor: !enabled ? Colors.grey[500] : null,
    filled: !enabled,
  );
  var emailField = validator == null
      ? TextField(
          decoration: decoration,
          controller: controller,
        )
      : TextFormField(
          decoration: decoration,
          controller: controller,
          validator: validator,
        );
  return Opacity(
    opacity: enabled ? 1 : 0.5,
    child: emailField,
  );
}

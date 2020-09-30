import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    // leading: Container(),
    automaticallyImplyLeading: false,
    title: Text('Settings'),
  );
}

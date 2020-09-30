import 'package:flutter/material.dart';
import 'package:taskapp/screens/welcome_screen.dart';

import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff1c3760),
        buttonColor: Color(0xFF4789f0),
        buttonTheme: ButtonThemeData(
          // buttonColor: Color(0xFF4789f0),
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.primary,
          // primarySwatch: Colors.blue,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
      // home: WelcomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/not-logged-in': (context) => NotLoggedInScreen(),
      },
    );
  }
}

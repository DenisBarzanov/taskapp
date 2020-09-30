import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/screens/cubit/profile_cubit.dart';
import 'package:taskapp/screens/welcome_screen.dart';
import 'package:taskapp/services/AuthService.dart';
import 'package:taskapp/services/ProfileService.dart';

import 'screens/cubit/login_cubit.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // StreamProvider(create: (context) => AuthService().user$),
        BlocProvider(create: (context) => LoginCubit(FakeAuthService())),
        BlocProvider(create: (context) => ProfileCubit(FakeProfileService())),
      ],
      child: MaterialApp(
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
          '/logged-in': (context) => LoggedInScreen(),
          '/not-logged-in': (context) => NotLoggedInScreen(),
        },
      ),
    );
  }
}

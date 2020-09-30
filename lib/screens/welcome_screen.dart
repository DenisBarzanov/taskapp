import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:taskapp/shared/User.dart';
import 'package:taskapp/shared/landing_text_style.dart';
import 'package:taskapp/shared/text_fields.dart';

import 'cubit/login_cubit.dart';
import 'cubit/profile_cubit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    final validator = (value) {
      print(value);
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    };
    var roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );

    var grey = Color(0xff898c91);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState)
          _isLoading = true;
        else
          _isLoading = false;
      },
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: _isLoading,
          child: Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text('Email'),
                        ),
                        getEmailField(
                          controller: emailController,
                          validator: validator,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 4.0, top: 20.0),
                          child: Text('Password'),
                        ),
                        getPasswordField(
                          withSuffix: true,
                          controller: passwordController,
                          validator: validator,
                          obscureText: _obscurePassword,
                          obscureTextOnPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: double.infinity,
                          child: FlatButton(
                            shape: roundedRectangleBorder,
                            color: Theme.of(context).buttonColor,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await context.bloc<LoginCubit>().login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                await context.bloc<ProfileCubit>().addUser(
                                      User(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                Navigator.of(context).pushNamed('/logged-in');
                              }
                            },
                            child: Text('Log in'),
                          ),
                        ),
                      ],
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
          ),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:taskapp/shared/User.dart';

abstract class ProfileService {
  getProfile();
}

class FakeProfileService implements ProfileService {
  FakeProfileService._internal();
  static FakeProfileService _instance = FakeProfileService._internal();
  factory FakeProfileService() => _instance;
  Future<User> getProfile() async {
    await Future.delayed(Duration(seconds: 1));
    // http request
    // get token from preferences and make a request
    // useless
    return User(email: 'johndoe@mail.com', password: '*******');
  }

  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
    // userController.sink.add(null);
  }
}

import 'dart:async';

abstract class AuthService {
  Future<String> login(String email, String password);
  Future<void> logout();
}

class FakeAuthService implements AuthService {
  // var userController = StreamController<User>();
  // Stream<User> user$;
  FakeAuthService._internal() {
    // user$ = userController.stream;
  }
  static FakeAuthService _instance = FakeAuthService._internal();
  factory FakeAuthService() => _instance;
  Future<String> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    // userController.sink.add(User(email: email, password: password));
    // save token in saved preferences
    return 'this-is-a-secret-token-from-the-server';
  }

  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
    // userController.sink.add(null);
  }
}

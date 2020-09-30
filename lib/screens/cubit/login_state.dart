part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class NotLoggedInState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoggedInState extends LoginState {
  final String token;
  LoggedInState({@required this.token});
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskapp/services/AuthService.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthService _authService;
  LoginCubit(this._authService) : super(NotLoggedInState());

  Future<void> login(String email, String password) async {
    // await try to login
    emit(LoginLoadingState());
    final token = await _authService.login(email, password);
    // emit user
    emit(LoggedInState(token: token));
  }

  void logout() async {
    await _authService.logout();
    emit(NotLoggedInState());
  }
}

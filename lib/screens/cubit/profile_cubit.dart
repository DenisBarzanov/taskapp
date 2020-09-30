import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskapp/services/ProfileService.dart';
import 'package:taskapp/shared/User.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileService _profileService;
  ProfileCubit(this._profileService) : super(ProfileInitial());

  Future<void> addUser(User user) async {
    emit(ProfileLoadedState(user));
  }
}

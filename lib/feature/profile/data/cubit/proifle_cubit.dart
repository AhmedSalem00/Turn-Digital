import 'package:bloc/bloc.dart';
import 'package:booking_application/feature/profile/data/cubit/profile_state.dart';
import 'package:booking_application/feature/profile/data/model/profile_model.dart';
import 'package:dio/dio.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchProfile() async {
    try {
      emit(ProfileLoading());
      final response = await Dio().get('http://api.td-dev.turndigital.net/api/organizers/1');
      if (response.statusCode == 200) {
        ProfileModel profile = ProfileModel.fromJson(response.data);
        emit(ProfileLoaded(profile));
      } else {
        emit(ProfileError("Failed to load profile"));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}

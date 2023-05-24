import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Data/entity/edit_profile/EditProfileModel.dart';
import '../../Data/repositry/repositry.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final Repository? repository;

  EditProfileCubit({required this.repository}) : super(EditProfileInitial());

  void editProfile(String firstName,
      String lastName,
      String email,
      File? avtar) async {
    emit(EditProfileLoadingState());
    EditProfileModel? editProfileResponse;
    try {
      editProfileResponse =
      await repository?.editProfile(firstName, lastName, email, avtar);
      emit(EditProfileSuccessState(editProfileResponse!));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        emit(EditProfileErrorState(
            error:
            "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(EditProfileErrorState(error: map['message']));
          } catch (e) {
            emit(EditProfileErrorState(error: "Internal server error"));
          }
        } else {
          emit(EditProfileErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Data/entity/login/LoginModel.dart';
import '../../Data/repositry/repositry.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository? repository;

  LoginCubit({required this.repository}) : super(LoginInitial());

  void login(String mobileNumber, String deviceId, String deviceType) async {
    print("Api call  -=====>");
    emit(LoginLoadingState());
    LoginModel? loginResponse;
    try {
      print("Api call  -=====>");
      loginResponse =
      await repository?.login(mobileNumber, deviceId, deviceType);
      print("Api response  -=====>" + loginResponse.toString());
      emit(LoginSuccessState(loginResponse!));
    } on DioError catch (ex) {
      print("Api error  -=====> ${ex.error}");
      if (ex.type == DioErrorType.connectTimeout) {
        print("error");

        emit(LoginErrorState(
            error:
                "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(LoginErrorState(error: map['message']));
          } catch (e) {
            emit(LoginErrorState(error: "Internal server error"));
          }
        } else {
          emit(LoginErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

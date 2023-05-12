import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Data/entity/register/RegisterModel.dart';
import '../../Data/repositry/repositry.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Repository? repository;
  RegisterCubit({required this.repository}) : super(RegisterInitial());

  void register(String firstName ,String lastName ,String email, String mobileNumber,String deviceId, String dedeviceType) async {
    print("Api call  -=====>");
    emit(RegisterLoadingState());
    RegisterModel? RegisterResponse;
    try {
      print("Api call  -=====>");
      RegisterResponse =
      await repository?.register(firstName, lastName, email, mobileNumber,deviceId,dedeviceType);
      print("Api response  -=====>" + RegisterResponse.toString());
      emit(RegisterSuccessState(RegisterResponse!));
    } on DioError catch (ex) {
      print("Api error  -=====> ${ex.error}");
      if (ex.type == DioErrorType.connectTimeout) {
        print("error");

        emit(RegisterErrorState(
            error:
            "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(RegisterErrorState(error: map['message']));
          } catch (e) {
            emit(RegisterErrorState(error: "Internal server error"));
          }
        } else {
          emit(RegisterErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

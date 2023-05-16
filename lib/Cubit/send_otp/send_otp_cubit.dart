import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Data/entity/send_otp/SendOtpModel.dart';
import '../../Data/repositry/repositry.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {

  final Repository? repository;

 SendOtpCubit({required this.repository}) : super(SendOtpInitial());

  void sendOtp(
      String mobileNumber) async {
    emit(SendOtpLoadingState());
   SendOtpModel?SendOtpResponse;
    try {
     SendOtpResponse =
      await repository?.sendOtp(mobileNumber);
      print("Api response  -=====>" +SendOtpResponse.toString());
      emit(SendOtpSuccessState(SendOtpResponse!));;
    } on DioError catch (ex) {
      print("Api error  -=====> ${ex.error}");
      if (ex.type == DioErrorType.connectTimeout) {
        emit(SendOtpErrorState(
            error:
            "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(SendOtpErrorState(error: map['message']));
          } catch (e) {
            emit(SendOtpErrorState(error: "Internal server error"));
          }
        } else {
          emit(SendOtpErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

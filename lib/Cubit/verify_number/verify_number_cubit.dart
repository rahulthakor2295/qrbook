import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:qr_book/Data/entity/verify_number/VerifyNumberModel.dart';

import '../../Data/repositry/repositry.dart';

part 'verify_number_state.dart';

class VerifyNumberCubit extends Cubit<VerifyNumberState> {
  final Repository? repository;

  VerifyNumberCubit({required this.repository}) : super(VerifyNumberInitial());

  void VerifyNumber(
      String mobileNumber) async {
    print("Api call  -=====>");
    emit(VerifyNumberLoadingState());
    VerifyNumberModel? verifyNumberResponse;
    try {
      print("Api call  -=====>");
      // response = await repository?.VerifyNumber(mobile, app);
      verifyNumberResponse =
      await repository?.verifyNumber(mobileNumber);
      print("Api response  -=====>" + verifyNumberResponse.toString());
      emit(VerifyNumberSuccessState(verifyNumberResponse!));
      // print(response.error);
      //
      // final res = json.decode(response as String) as Map<String, dynamic>;
      // print(res);
      // print("Sucees");
    } on DioError catch (ex) {
      print("Api error  -=====> ${ex.error}");
      if (ex.type == DioErrorType.connectTimeout) {
        print("error");

        emit(VerifyNumberErrorState(
            error:
            "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(VerifyNumberErrorState(error: map['message']));
          } catch (e) {
            emit(VerifyNumberErrorState(error: "Internal server error"));
          }
        } else {
          emit(VerifyNumberErrorState(error: "Internal server error!"));
        }
      }
    }
  }
  
}

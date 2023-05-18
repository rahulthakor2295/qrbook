import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../Data/entity/personal_infomation/getCity/GetCityModel.dart';
import '../../../Data/repositry/repositry.dart';

part 'get_city_state.dart';

class GetCityCubit extends Cubit<GetCityState> {
  final Repository? repository;

  GetCityCubit({required this.repository}) : super(GetCityInitial());

  void getCity(int? stateId) async {
    emit(GetCityLoadingState());
    GetCityModel? cityResponse;
    try {
      cityResponse = await repository?.getCity(stateId!);
      emit(GetCitySuccessState (cityResponse!));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        emit(GetCityErrorState( error: "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(GetCityErrorState(error: map['message']));
          } catch (e) {
            emit(GetCityErrorState(error: "Internal server error"));
          }
        } else {
          emit(GetCityErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

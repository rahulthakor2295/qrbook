import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../Data/entity/personal_infomation/get_state/GetStateModel.dart';
import '../../../Data/repositry/repositry.dart';

part 'get_state_state.dart';

class GetStateCubit extends Cubit<GetStateState> {
  final Repository? repository;

  GetStateCubit({required this.repository}) : super(GetStateInitial());

  void getState(int? countryId) async {
    emit(GetStateLoadingState());
    GetStateModel? stateResponse;
    try {
      stateResponse = await repository?.geState(countryId!);
      emit(GetStateSuccessState (stateResponse!));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        emit(GetStateErrorState( error: "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(GetStateErrorState(error: map['message']));
          } catch (e) {
            emit(GetStateErrorState(error: "Internal server error"));
          }
        } else {
          emit(GetStateErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

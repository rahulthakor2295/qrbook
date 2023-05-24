import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../../Data/entity/setting/terms_condition/TermsCondition.dart';
import '../../../Data/repositry/repositry.dart';

part 'terms_condition_state.dart';

class TermsConditionCubit extends Cubit<TermsConditionState> {

  final Repository? repository;

  TermsConditionCubit({required this.repository}) : super(TermsConditionInitial());

  void termsCondition(String? termsCondition) async {
    emit(TermsConditionLoadingState());
    TermsConditionModel? termsConditionResponse;
    try {
      termsConditionResponse = await repository?.termsCondition(termsCondition);
      emit(TermsConditionSuccessState (termsConditionResponse!));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        emit(TermsConditionErrorState( error: "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(TermsConditionErrorState(error: map['message']));
          } catch (e) {
            emit(TermsConditionErrorState(error: "Internal server error"));
          }
        } else {
          emit(TermsConditionErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

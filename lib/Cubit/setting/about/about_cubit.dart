import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../Data/entity/setting/about/AboutModel.dart';
import '../../../Data/repositry/repositry.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  final Repository? repository;

  AboutCubit({required this.repository}) : super(AboutInitial());

  void about(String? about) async {
    emit(AboutLoadingState());
    AboutModel? aboutResponse;
    try {
      aboutResponse = await repository?.about(about);
      emit(AboutSuccessState (aboutResponse!));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        emit(AboutErrorState( error: "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(AboutErrorState(error: map['message']));
          } catch (e) {
            emit(AboutErrorState(error: "Internal server error"));
          }
        } else {
          emit(AboutErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

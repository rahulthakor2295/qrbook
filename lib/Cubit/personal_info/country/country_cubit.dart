import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:qr_book/Data/entity/personal_infomation/get_country/Data.dart';

import '../../../Data/entity/personal_infomation/get_country/GetCountryModel.dart';
import '../../../Data/repositry/repositry.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final Repository? repository;

  CountryCubit({required this.repository}) : super(CountryInitial());

  void country() async {
    emit(CountryLoadingState());
    GetCountryModel? countryResponse;
    try {
      countryResponse = await repository?.getCountry();
      emit(CountrySuccessState (countryResponse!,));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        emit(CountryErrorState( error: "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(CountryErrorState(error: map['message']));
          } catch (e) {
            emit(CountryErrorState(error: "Internal server error"));
          }
        } else {
          emit(CountryErrorState(error: "Internal server error!"));
        }
      }
    }
  }
  // void selectCountry(Data? country) {
  //   emit(CountrySuccessState (state.countries , ));
  //   if (country != null) {
  //     int selectedCountryId = country.id;
  //     print('Selected Country ID: $selectedCountryId');
  //   }
  // }
}

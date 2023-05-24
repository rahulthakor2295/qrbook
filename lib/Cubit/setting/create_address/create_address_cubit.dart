import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../Data/entity/setting/address_managemment/create_address/CreateaddModel.dart';
import '../../../Data/repositry/repositry.dart';

part 'create_address_state.dart';

class CreateAddressCubit extends Cubit<CreateAddressState> {
  final Repository? repository;

  CreateAddressCubit({required this.repository})
      : super(CreateAddressInitial());
  void createAddress(

      String? addressLine1,
      String? addressLine2,
      String? landmark,
      int? countryId,
      int? stateId,
      int? cityId,
      String? pincode,
      int addressType,
      int isDefault) async {
    print("Api call  -=====>");
    emit(CreateAddressLoadingState());
    CreateaddModel? createAddressResponse;
    try {
      print("Api call  -=====>");
      createAddressResponse = await repository?.createAddress(
          addressLine1,
          addressLine2,
          landmark,
          countryId,
          stateId,
          cityId,
          pincode,
          addressType,
          isDefault);
      print("Api response  -=====>" + createAddressResponse.toString());
      emit(CreateAddressSuccessState(createAddressResponse!));
    } on DioError catch (ex) {
      print("Api error  -=====> ${ex.error}");
      if (ex.type == DioErrorType.connectTimeout) {
        print("error");

        emit(CreateAddressErrorState(
            error:
                "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(CreateAddressErrorState(error: map['message']));
          } catch (e) {
            emit(CreateAddressErrorState(error: "Internal server error"));
          }
        } else {
          emit(CreateAddressErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

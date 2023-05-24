import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../Data/entity/setting/address_managemment/update_address/UpdateAddressModel.dart';
import '../../../Data/repositry/repositry.dart';

part 'update_address_state.dart';

class UpdateAddressCubit extends Cubit<UpdateAddressState> {
  final Repository? repository;

  UpdateAddressCubit({required this.repository})
      : super(UpdateAddressInitial());

  void updateAddress(
      String? addressLine1,
      String? addressLine2,
      String? landmark,
      int? countryId,
      int? stateId,
      int? cityId,
      String? pincode,
      int addressType,
      int isDefault,
      String id) async {
    print("Api call  -=====>");
    emit(UpdateAddressLoadingState());
    UpdateAddressModel? updateAddressResponse;
    try {
      print("Api call  -=====>");
      updateAddressResponse = await repository?.updateAddress(
          addressLine1,
          addressLine2,
          landmark,
          countryId,
          stateId,
          cityId,
          pincode,
          addressType,
          isDefault,
          id);
      print("Api response  -=====>" + updateAddressResponse.toString());
      emit(UpdateAddressSuccessState(updateAddressResponse!));
    } on DioError catch (ex) {
      print("Api error  -=====> ${ex.error}");
      if (ex.type == DioErrorType.connectTimeout) {
        print("error");

        emit(UpdateAddressErrorState(
            error:
                "Connection time out. Please check your internet connection."));
      } else {
        if (ex.response?.statusCode == 400) {
          try {
            Map<String, dynamic> map = ex.response?.data;
            emit(UpdateAddressErrorState(error: map['message']));
          } catch (e) {
            emit(UpdateAddressErrorState(error: "Internal server error"));
          }
        } else {
          emit(UpdateAddressErrorState(error: "Internal server error!"));
        }
      }
    }
  }
}

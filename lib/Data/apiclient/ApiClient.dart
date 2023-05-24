import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:qr_book/Data/entity/edit_profile/EditProfileModel.dart';
import 'package:qr_book/Data/entity/login/LoginModel.dart';
import 'package:qr_book/Data/entity/personal_infomation/get_state/GetStateModel.dart';
import 'package:qr_book/Data/entity/setting/about/AboutModel.dart';
import 'package:retrofit/http.dart';
import 'dart:io';
import '../entity/personal_infomation/getCity/GetCityModel.dart';
import '../entity/personal_infomation/get_country/GetCountryModel.dart';
import '../entity/register/RegisterModel.dart';
import '../entity/send_otp/SendOtpModel.dart';
import '../entity/setting/address_managemment/create_address/CreateaddModel.dart';
import '../entity/setting/address_managemment/update_address/UpdateAddressModel.dart';
import '../entity/setting/terms_condition/TermsCondition.dart';
import '../entity/slier_model.dart';
import '../entity/verify_number/VerifyNumberModel.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: 'https://qrbook.thewebtual.com/api/v1/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        responseType: ResponseType.plain,
        headers: {
          'Authorization': 'Bearer'
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3FyYm9vay50aGV3ZWJ0dWFsLmNvbS9hcGkvdjEvY3VzdG9tZXIvYXV0aC9sb2dpbi1tb2JpbGUiLCJpYXQiOjE2ODQ5MTI2NTAsImV4cCI6MTY4NzU0MDY1MCwibmJmIjoxNjg0OTEyNjUwLCJqdGkiOiJ1NWh2THYzb3Jta1puN2gzIiwic3ViIjoiMTI5IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.UzvkgrMvx-37wih4ehDuVp4c2OxfbgILlBtmkdGst9c"
        });
    dio.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onResponse: (response, handler) {
    //       if (response.requestOptions.method == HttpMethod.POST) {
    //         response.data = jsonDecode(response.data as String);
    //       }
    //       return handler.next(response);
    //     },
    //   ),
    // );

    // 'Content-Type': 'application/json'

    return _ApiClient(dio, baseUrl: baseUrl);
  }

//verify number
  @POST('customer/auth/check-mobile')
  @FormUrlEncoded()
  Future<VerifyNumberModel> verifyNumber(@Field('mobile_number') mobileNumber);

//login
  @POST('customer/auth/login-mobile')
  @FormUrlEncoded()
  Future<LoginModel> login(
    @Field('mobile_number') mobileNumber,
    @Field('device_id') deviceId,
    @Field('device_type') deviceType,
  );

  @POST('customer/auth/register-mobile')
  @FormUrlEncoded()
  Future<RegisterModel> register(
    @Field('first_name') firstName,
    @Field('last_name') lastName,
    @Field('email') email,
    @Field('mobile_number') mobileNumber,
    @Field('device_id') deviceId,
    @Field('device_type') deviceType,
    @Field('address_line1') addressLine1,
    @Field('address_line2') addressLine2,
    @Field('landmark') landmark,
    @Field('country_id') countryId,
    @Field('state_id') stateId,
    @Field('city_id') cityId,
    @Field('pincode') pincode,
    @Field('address_type') addressType,
  );

  @POST('School/get_ad_image.php')
  @FormUrlEncoded()
  Future<SliderResponse> imageSlider(
    @Field('school_id') schoolId,
    @Field('version') versionId,
    @Field('user_id') userId,
    @Field('app_type') appType,
  );

  @GET('customer/get-country')
  Future<GetCountryModel> getCountry();

  @GET("customer/get-state")
  Future<GetStateModel> getState(
    @Query("country_id") int? countryId,
  );

  @GET('customer/get-city')
  Future<GetCityModel> getCity(
    @Query("state_id") int? stateId,
  );

  @POST('customer/auth/send-otp')
  Future<SendOtpModel> sendOtp(
    @FormUrlEncoded() @Field('mobile_number') mobileNumber,
  );

  @POST('customer/get-content')
  Future<AboutModel> about(
    @FormUrlEncoded() @Field('code') about,
  );

  @POST('customer/get-content')
  Future<TermsConditionModel> termsCondition(
    @FormUrlEncoded() @Field('code') termsCondition,
  );

  @POST('customer/update-profile')
  @MultiPart()
  Future<EditProfileModel> editProfile(
    @Part(name: 'first_name') String firstName,
    @Part(name: 'last_name') String lastName,
    @Part(name: 'email') String email,
    @Part(name: 'avtar') File avtar,
  );

  @POST('customer/address/create-address')
  @FormUrlEncoded()
  Future<CreateaddModel> createAddress(
    @Field('address_line1') addressLine1,
    @Field('address_line2') addressLine2,
    @Field('landmark') landmark,
    @Field('country_id') countryId,
    @Field('state_id') stateId,
    @Field('city_id') cityId,
    @Field('pincode') pincode,
    @Field('address_type') addressType,
    @Field('is_default') isDefault,
  );

  @POST('customer/address/update-address')
  @FormUrlEncoded()
  Future<UpdateAddressModel> updateAddress(
    @Field('address_line1') addressLine1,
    @Field('address_line2') addressLine2,
    @Field('landmark') landmark,
    @Field('country_id') countryId,
    @Field('state_id') stateId,
    @Field('city_id') cityId,
    @Field('pincode') pincode,
    @Field('address_type') addressType,
    @Field('is_default') isDefault,
    @Field('id') id,
  );
}

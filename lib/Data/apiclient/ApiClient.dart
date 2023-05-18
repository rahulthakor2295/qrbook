import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:qr_book/Data/entity/login/LoginModel.dart';
import 'package:qr_book/Data/entity/personal_infomation/get_state/GetStateModel.dart';
import 'package:retrofit/http.dart';

import '../entity/personal_infomation/getCity/GetCityModel.dart';
import '../entity/personal_infomation/get_country/GetCountryModel.dart';
import '../entity/register/RegisterModel.dart';
import '../entity/send_otp/SendOtpModel.dart';
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
      headers: { 'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3YxL2N1c3RvbWVyL2F1dGgvbG9naW4tbW9iaWxlIiwiaWF0IjoxNjgyNDg4MTIxLCJleHAiOjE2ODUxMTYxMjEsIm5iZiI6MTY4MjQ4ODEyMSwianRpIjoidFBsUzRrS2hxTXBNcGVZNSIsInN1YiI6IjM2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.xWI12GKZV3BEGF8cPQ7e1H7Y1nrzCPIUAwEpEtfRPiw'},
    );
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
  Future<VerifyNumberModel>verifyNumber(
      @Field('mobile_number')mobileNumber
      );
//login
  @POST('customer/auth/login-mobile')
  @FormUrlEncoded()
  Future<LoginModel>login(
      @Field('mobile_number')mobileNumber,
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
      @Field('landmark')landmark,
      @Field('country_id') countryId,
      @Field('state_id') stateId,
      @Field('city_id') cityId,
      @Field('pincode')pincode,
      @Field('address_type')addressType,

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
  Future<GetCountryModel> getCountry ();


  @GET("customer/get-state")
  Future<GetStateModel> getState(
      @Query("country_id")int? countryId,
      );


 @GET('customer/get-city')
  Future<GetCityModel> getCity (
     @Query("state_id")int?  stateId,
     );

  @POST('customer/auth/send-otp')
  Future<SendOtpModel> sendOtp (
  @FormUrlEncoded()
  @Field('mobile_number') mobileNumber,
  );

}

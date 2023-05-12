import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:retrofit/http.dart';

import '../entity/personal_infomation/get_country/GetCountryModel.dart';
import '../entity/register/RegisterModel.dart';
import '../entity/slier_model.dart';
import '../entity/verify_number/VerifyNumberModel.dart';


part 'ApiClient.g.dart';

@RestApi(baseUrl: 'https://qrbook.thewebtual.com/api/v1/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      headers: { 'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3YxL2N1c3RvbWVyL2F1dGgvbG9naW4tbW9iaWxlIiwiaWF0IjoxNjgyNDg4MTIxLCJleHAiOjE2ODUxMTYxMjEsIm5iZiI6MTY4MjQ4ODEyMSwianRpIjoidFBsUzRrS2hxTXBNcGVZNSIsInN1YiI6IjM2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.xWI12GKZV3BEGF8cPQ7e1H7Y1nrzCPIUAwEpEtfRPiw'},
      responseType: ResponseType.plain,
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


  @POST('customer/auth/check-mobile')
  @FormUrlEncoded()
  Future<VerifyNumberModel>verifyNumber(
      @Field('mobile_number')mobileNumber
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

}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://qrbook.thewebtual.com/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<VerifyNumberModel> verifyNumber(mobileNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'mobile_number': mobileNumber};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<VerifyNumberModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'customer/auth/check-mobile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyNumberModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginModel> login(
    mobileNumber,
    deviceId,
    deviceType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'mobile_number': mobileNumber,
      'device_id': deviceId,
      'device_type': deviceType,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'customer/auth/login-mobile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterModel> register(
    firstName,
    lastName,
    email,
    mobileNumber,
    deviceId,
    deviceType,
    addressLine1,
    addressLine2,
    landmark,
    countryId,
    stateId,
    cityId,
    pincode,
    addressType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'mobile_number': mobileNumber,
      'device_id': deviceId,
      'device_type': deviceType,
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'landmark': landmark,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'pincode': pincode,
      'address_type': addressType,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RegisterModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'customer/auth/register-mobile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SliderResponse> imageSlider(
    schoolId,
    versionId,
    userId,
    appType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'school_id': schoolId,
      'version': versionId,
      'user_id': userId,
      'app_type': appType,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SliderResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'School/get_ad_image.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SliderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCountryModel> getCountry() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetCountryModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customer/get-country',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCountryModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetStateModel> getState(countryId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'country_id': countryId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetStateModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customer/get-state',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetStateModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCityModel> getCity(stateId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'state_id': stateId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetCityModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customer/get-city',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCityModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SendOtpModel> sendOtp(mobileNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'mobile_number': mobileNumber};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SendOtpModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customer/auth/send-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SendOtpModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AboutModel> about(about) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'code': about};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AboutModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customer/get-content',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AboutModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TermsConditionModel> termsCondition(termsCondition) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'code': termsCondition};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TermsConditionModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'customer/get-content',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TermsConditionModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EditProfileModel> editProfile(
    firstName,
    lastName,
    email,
    avtar,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'first_name',
      firstName,
    ));
    _data.fields.add(MapEntry(
      'last_name',
      lastName,
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.files.add(MapEntry(
      'avtar',
      MultipartFile.fromFileSync(
        avtar.path,
        filename: avtar.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<EditProfileModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'customer/update-profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EditProfileModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateaddModel> createAddress(
    addressLine1,
    addressLine2,
    landmark,
    countryId,
    stateId,
    cityId,
    pincode,
    addressType,
    isDefault,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'landmark': landmark,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'pincode': pincode,
      'address_type': addressType,
      'is_default': isDefault,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CreateaddModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'customer/address/create-address',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateaddModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateAddressModel> updateAddress(
    addressLine1,
    addressLine2,
    landmark,
    countryId,
    stateId,
    cityId,
    pincode,
    addressType,
    isDefault,
    id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'landmark': landmark,
      'country_id': countryId,
      'state_id': stateId,
      'city_id': cityId,
      'pincode': pincode,
      'address_type': addressType,
      'is_default': isDefault,
      'id': id,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UpdateAddressModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'customer/address/update-address',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateAddressModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

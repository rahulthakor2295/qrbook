
import '../apiclient/ApiClient.dart';
import '../entity/login/LoginModel.dart';
import '../entity/personal_infomation/getCity/GetCityModel.dart';
import '../entity/personal_infomation/get_country/GetCountryModel.dart';
import '../entity/personal_infomation/get_state/GetStateModel.dart';
import '../entity/register/RegisterModel.dart';
import '../entity/send_otp/SendOtpModel.dart';
import '../entity/slier_model.dart';
import '../entity/verify_number/VerifyNumberModel.dart';

class Repository {
  late ApiClient apiClient;

  Repository({required this.apiClient});

  Future<SliderResponse> sliderImage(int schoolId, double versionId, int userId,
      String appType) =>
      apiClient.imageSlider(schoolId, versionId, userId, appType);

  Future< VerifyNumberModel> verifyNumber(String mobileNumber) =>apiClient.verifyNumber(mobileNumber);
  Future< LoginModel> login(String mobileNumber, String deviceId, String deviceType,) =>apiClient.login(mobileNumber, deviceId, deviceType);
  Future<RegisterModel> register (
      String firstName ,
      String lastName ,
      String email,
      String mobileNumber,
      String deviceId,
      String dedeviceType,
      String? addressLine1,
      String? addressLine2,
      String? landmark,
      int? countryId,
      int? stateId,
      int? cityId,
      String? pincode,
  int addressType
      ) =>
      apiClient.register(firstName, lastName, email, mobileNumber,deviceId,dedeviceType,addressLine1,addressLine2,landmark,countryId,stateId,cityId,pincode,addressType);
  Future<GetCountryModel>getCountry() => apiClient.getCountry();
  Future<GetStateModel>geState(int countryId) =>
      apiClient.getState(countryId);
  Future<GetCityModel>getCity(int stateId) => apiClient.getCity(stateId);
  Future<SendOtpModel>sendOtp(String? mobileNumber) => apiClient.sendOtp(mobileNumber);
}
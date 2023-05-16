
import '../apiclient/ApiClient.dart';
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
      String? countryId,
      String? stateId,
      String? cityId,
      String? pincode) =>
      apiClient.register(firstName, lastName, email, mobileNumber,deviceId,dedeviceType,addressLine1,addressLine2,landmark,countryId,stateId,cityId,pincode);
  Future<GetCountryModel>getCountry() => apiClient.getCountry();
  Future<GetStateModel>geState() => apiClient.getState();
  Future<GetCityModel>getCity() => apiClient.getCity();
  Future<SendOtpModel>sendOtp(String? mobileNumber) => apiClient.sendOtp(mobileNumber);
}
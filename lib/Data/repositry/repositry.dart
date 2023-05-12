
import '../apiclient/ApiClient.dart';
import '../entity/personal_infomation/get_country/GetCountryModel.dart';
import '../entity/register/RegisterModel.dart';
import '../entity/slier_model.dart';
import '../entity/verify_number/VerifyNumberModel.dart';

class Repository {
  late ApiClient apiClient;

  Repository({required this.apiClient});

  Future<SliderResponse> sliderImage(int schoolId, double versionId, int userId,
      String appType) =>
      apiClient.imageSlider(schoolId, versionId, userId, appType);

  Future< VerifyNumberModel> verifyNumber(String mobileNumber) =>apiClient.verifyNumber(mobileNumber);
  Future<RegisterModel> register (String firstName ,String lastName ,String email, String mobileNumber,String deviceId, String dedeviceType)=> apiClient.register(firstName, lastName, email, mobileNumber,deviceId,dedeviceType);
  Future<GetCountryModel>getCountry() => apiClient.getCountry();
}
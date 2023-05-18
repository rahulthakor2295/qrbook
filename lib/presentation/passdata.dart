class ScreenArguments {
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  bool?   loginRegister;  // true: login false: register
  String? addressLine1;
  String? addressLine2;
  String? landMark;
  int? countryId;
  int? stateId;
  int?  cityId;
  String? pincode;
  int? addressType;

  ScreenArguments(this.firstName,this.lastName,this.mobile,this.email);

  Map<String, dynamic> toMap() {
    return {
      'firstname' :firstName,
      'lastname' :lastName,
      'mobile' :mobile,
      'email' :email,
      'login_register' :loginRegister,
      'address_line_1' :addressLine1,
      'address_line_2' :addressLine2,
      'land_mark' :landMark,
      'country_id' :countryId,
      'state_id' :stateId,
      'city_id' :cityId,
      'pin_code' :pincode,
      'address_type' :addressType,
    };
  }

  ScreenArguments.fromJson(Map json) {
    this.firstName = json["firstname"];
    this.lastName = json["lastname"];
    this.mobile = json["mobile"];
    this.email = json["email"];
    this.loginRegister = json["login_register"];
    this.addressLine1 = json["address_line_1"];
    this.addressLine2 = json["address_line_2"];
    this.landMark = json["land_mark"];
    this.countryId = json["country_id"];
    this.stateId = json["state_id"];
    this.cityId = json["city_id"];
    this.pincode = json["pin_code"];
    this.addressType = json["address_type"];
  }
}

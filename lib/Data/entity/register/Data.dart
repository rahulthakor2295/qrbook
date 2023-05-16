class Data {
  Data({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.mobileNumber, 
      this.deviceId, 
      this.deviceType, 
      this.cityId, 
      this.countryId, 
      this.stateId, 
      this.pincode, 
      this.addressLine1, 
      this.addressLine2, 
      this.landmark,});

  Data.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    cityId = json['city_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    pincode = json['pincode'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    landmark = json['landmark'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? deviceId;
  String? deviceType;
  String? cityId;
  String? countryId;
  String? stateId;
  String? pincode;
  String? addressLine1;
  String? addressLine2;
  String? landmark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['mobile_number'] = mobileNumber;
    map['device_id'] = deviceId;
    map['device_type'] = deviceType;
    map['city_id'] = cityId;
    map['country_id'] = countryId;
    map['state_id'] = stateId;
    map['pincode'] = pincode;
    map['address_line1'] = addressLine1;
    map['address_line2'] = addressLine2;
    map['landmark'] = landmark;
    return map;
  }

}
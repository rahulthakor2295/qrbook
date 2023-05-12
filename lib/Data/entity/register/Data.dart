class Data {
  Data({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.mobileNumber, 
      this.deviceId, 
      this.deviceType,});

  Data.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? deviceId;
  String? deviceType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['mobile_number'] = mobileNumber;
    map['device_id'] = deviceId;
    map['device_type'] = deviceType;
    return map;
  }

}
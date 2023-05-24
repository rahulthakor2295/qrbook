class Data {
  Data({
    this.id,
    this.addressType,
    this.addressLine1,
    this.addressLine2,
    this.cityId,
    this.stateId,
    this.countryId,
    this.isDefault,
    this.pincode,
    this.landmark,
    this.name,
    this.email,
    this.mobileNumber,
    this.country,
    this.state,
    this.city,
    this.addressLineOne,
    this.addressLineTwo,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    addressType = json['address_type'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    isDefault = json['is_default'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    addressLineOne = json['address_line_one'];
    addressLineTwo = json['address_line_two'];
  }

  String? id;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? cityId;
  String? stateId;
  String? countryId;
  String? isDefault;
  String? pincode;
  String? landmark;
  String? name;
  String? email;
  String? mobileNumber;
  String? country;
  String? state;
  String? city;
  String? addressLineOne;
  String? addressLineTwo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address_type'] = addressType;
    map['address_line1'] = addressLine1;
    map['address_line2'] = addressLine2;
    map['city_id'] = cityId;
    map['state_id'] = stateId;
    map['country_id'] = countryId;
    map['is_default'] = isDefault;
    map['pincode'] = pincode;
    map['landmark'] = landmark;
    map['name'] = name;
    map['email'] = email;
    map['mobile_number'] = mobileNumber;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['address_line_one'] = addressLineOne;
    map['address_line_two'] = addressLineTwo;
    return map;
  }
}

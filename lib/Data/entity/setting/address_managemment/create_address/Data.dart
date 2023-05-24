class Data {
  Data({
      this.userId, 
      this.addressType, 
      this.addressLine1, 
      this.addressLine2, 
      this.cityId, 
      this.stateId, 
      this.countryId, 
      this.landmark, 
      this.pincode, 
      this.isDefault, 
      this.createdBy, 
      this.updatedBy, 
      this.updatedAt, 
      this.createdAt, 
      this.id, 
      this.displayAddressType,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    addressType = json['address_type'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    landmark = json['landmark'];
    pincode = json['pincode'];
    isDefault = json['is_default'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    displayAddressType = json['display_address_type'];
  }
  int? userId;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? cityId;
  String? stateId;
  String? countryId;
  String? landmark;
  String? pincode;
  int? isDefault;
  int? createdBy;
  int? updatedBy;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? displayAddressType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['address_type'] = addressType;
    map['address_line1'] = addressLine1;
    map['address_line2'] = addressLine2;
    map['city_id'] = cityId;
    map['state_id'] = stateId;
    map['country_id'] = countryId;
    map['landmark'] = landmark;
    map['pincode'] = pincode;
    map['is_default'] = isDefault;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['display_address_type'] = displayAddressType;
    return map;
  }

}
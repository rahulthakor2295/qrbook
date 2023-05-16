class DataState {
  DataState({
      this.countryName, 
      this.name, 
      this.createdAt, 
      this.updatedAt,});

  DataState.fromJson(dynamic json) {
    countryName = json['country_name'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? countryName;
  String? name;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_name'] = countryName;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}
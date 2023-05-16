class DataCity {
  DataCity({
      this.stateName, 
      this.name, 
      this.createdAt, 
      this.updatedAt,});

  DataCity.fromJson(dynamic json) {
    stateName = json['state_name'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? stateName;
  String? name;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state_name'] = stateName;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}
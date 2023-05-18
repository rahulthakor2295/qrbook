class DataState {
  DataState({
      this.id, 
      this.countryId, 
      this.name, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  DataState.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  int? countryId;
  String? name;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}
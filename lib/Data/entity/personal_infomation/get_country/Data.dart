class Data {
  Data({
      this.id, 
      this.sortName, 
      this.name, 
      this.phoneCode, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    sortName = json['sort_name'];
    name = json['name'];
    phoneCode = json['phone_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? sortName;
  String? name;
  int? phoneCode;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sort_name'] = sortName;
    map['name'] = name;
    map['phone_code'] = phoneCode;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}
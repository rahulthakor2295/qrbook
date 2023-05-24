class AboutData {
  AboutData({
      this.id, 
      this.pageName, 
      this.pageDescription, 
      this.code, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.deletedBy, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  AboutData.fromJson(dynamic json) {
    id = json['id'];
    pageName = json['page_name'];
    pageDescription = json['page_description'];
    code = json['code'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? pageName;
  String? pageDescription;
  String? code;
  int? status;
  int? createdBy;
  int? updatedBy;
  dynamic? deletedBy;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_name'] = pageName;
    map['page_description'] = pageDescription;
    map['code'] = code;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['deleted_by'] = deletedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}
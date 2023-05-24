class User {
  User({
      this.id, 
      this.parentId, 
      this.roleId, 
      this.ezyUserId, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.emailVerifiedAt, 
      this.mobileNumber, 
      this.mobileVerifiedAt, 
      this.avatar, 
      this.status, 
      this.designation, 
      this.createdBy, 
      this.updatedBy, 
      this.deletedBy, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    roleId = json['role_id'];
    ezyUserId = json['ezy_user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobileNumber = json['mobile_number'];
    mobileVerifiedAt = json['mobile_verified_at'];
    avatar = json['avatar'];
    status = json['status'];
    designation = json['designation'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  dynamic? parentId;
  int? roleId;
  int? ezyUserId;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? mobileNumber;
  String? mobileVerifiedAt;
  String? avatar;
  int? status;
  dynamic designation;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent_id'] = parentId;
    map['role_id'] = roleId;
    map['ezy_user_id'] = ezyUserId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['mobile_number'] = mobileNumber;
    map['mobile_verified_at'] = mobileVerifiedAt;
    map['avatar'] = avatar;
    map['status'] = status;
    map['designation'] = designation;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['deleted_by'] = deletedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}
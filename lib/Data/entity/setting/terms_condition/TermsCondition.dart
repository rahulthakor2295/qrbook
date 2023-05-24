import 'Data.dart';

class TermsConditionModel {
  TermsConditionModel({
      this.status, 
      this.message, 
      this.data,});

  TermsConditionModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? TermConData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  TermConData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}
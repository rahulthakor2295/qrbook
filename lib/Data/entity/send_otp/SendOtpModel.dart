import 'Data.dart';

class SendOtpModel {
  SendOtpModel({
      this.status, 
      this.message, 
      this.data,});

  SendOtpModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SendOtpData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  SendOtpData? data;

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
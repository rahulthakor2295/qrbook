import 'Data.dart';

class AboutModel {
  AboutModel({
      this.status, 
      this.message, 
      this.data,});

  AboutModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? AboutData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  AboutData? data;

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
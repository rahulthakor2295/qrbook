import 'Data.dart';

class GetCityModel {
  GetCityModel({
      this.status, 
      this.message, 
      this.data,});

  GetCityModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataCity.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<DataCity>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
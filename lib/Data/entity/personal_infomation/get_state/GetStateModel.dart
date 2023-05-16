
import 'Data.dart';

class GetStateModel {
  GetStateModel({
      this.status, 
      this.message, 
      this.data,});

  GetStateModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataState.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<DataState>? data;

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
import 'User.dart';

class Data {
  Data({
      this.user, 
      this.assetUrl,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    assetUrl = json['asset_url'];
  }
  User? user;
  String? assetUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['asset_url'] = assetUrl;
    return map;
  }

}
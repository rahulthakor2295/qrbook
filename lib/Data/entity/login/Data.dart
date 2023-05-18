import 'User.dart';

class LoginData {
  LoginData({
      this.token, 
      this.user, 
      this.assetUrl,});

  LoginData.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? LoginUser.fromJson(json['user']) : null;
    assetUrl = json['asset_url'];
  }
  String? token;
  LoginUser? user;
  String? assetUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['asset_url'] = assetUrl;
    return map;
  }

}
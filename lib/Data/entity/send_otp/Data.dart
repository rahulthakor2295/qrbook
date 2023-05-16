class SendOtpData {
  SendOtpData({
      this.otpVal,});

  SendOtpData.fromJson(dynamic json) {
    otpVal = json['otp_val'];
  }
  int? otpVal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp_val'] = otpVal;
    return map;
  }

}
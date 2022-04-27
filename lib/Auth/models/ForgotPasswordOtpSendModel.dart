class ForgotPasswordSendOtp {
  ForgotPasswordSendOtp({
    required this.status,
    required this.message,
    required this.otp,
  });
  late final String status;
  late final String message;
  late final String otp;
  
  ForgotPasswordSendOtp.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    otp = json['otp'];
  }
  ForgotPasswordSendOtp.fromError(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
   
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['otp'] = otp;
    return _data;
  }
}
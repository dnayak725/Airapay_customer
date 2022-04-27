class ForgotVerifyOtpModel {
  ForgotVerifyOtpModel({
    required this.status,
  });
  late final String status;
  
  ForgotVerifyOtpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
  }
 ForgotVerifyOtpModel.fromError(Map<String, dynamic> json){
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    return _data;
  }
}
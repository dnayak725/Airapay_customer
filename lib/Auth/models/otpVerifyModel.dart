class VerifyOtpModel {
  VerifyOtpModel({
    required this.status,
  });
  late final String status;
  
  VerifyOtpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
  }
 VerifyOtpModel.fromError(Map<String, dynamic> json){
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    return _data;
  }
}
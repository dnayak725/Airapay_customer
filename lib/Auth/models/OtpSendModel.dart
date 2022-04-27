class OtpSendModel {
   late final String status;
  late final String message;
  OtpSendModel({
    required this.status,
    required this.message,
  });
 
  
  OtpSendModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
 OtpSendModel.fromError(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
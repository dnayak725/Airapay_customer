class UpdateProfileModel {
  UpdateProfileModel({
    required this.status,
    required this.message,
  });
  late final String status;
  late final String message;
  
  UpdateProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
  UpdateProfileModel.fromError(Map<String, dynamic> json){
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
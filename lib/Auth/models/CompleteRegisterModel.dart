class CompleteRegisterModel {
  CompleteRegisterModel({
    required this.status,
    required this.message,
  
  });
  late final String status;
  late final String message;
 
  
  CompleteRegisterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  
  }
  CompleteRegisterModel.fromError(Map<String, dynamic> json){
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

class Data {
  Data({
    required this.user,
    required this.customer,
    required this.token,
  });
  late final User user;
  late final Customer customer;
  late final String token;
  
  Data.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    customer = Customer.fromJson(json['customer']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['customer'] = customer.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.email,
    required this.emailVerificationToken,
    required this.phoneNumber,
    required this.emailIsVerified,
    required this.isVerified,
    required this.isSuspended,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String email;
  late final String emailVerificationToken;
  late final String phoneNumber;
  late final int emailIsVerified;
  late final int isVerified;
  late final int isSuspended;
  late final String updatedAt;
  late final String createdAt;
  late final int id;
  
  User.fromJson(Map<String, dynamic> json){
    email = json['email'];
    emailVerificationToken = json['email_verification_token'];
    phoneNumber = json['phone_number'];
    emailIsVerified = json['email_is_verified'];
    isVerified = json['is_verified'];
    isSuspended = json['is_suspended'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['email_verification_token'] = emailVerificationToken;
    _data['phone_number'] = phoneNumber;
    _data['email_is_verified'] = emailIsVerified;
    _data['is_verified'] = isVerified;
    _data['is_suspended'] = isSuspended;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}

class Customer {
  Customer({
    required this.customerName,
    required this.mykadNumber,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String customerName;
  late final String mykadNumber;
  late final int userId;
  late final String updatedAt;
  late final String createdAt;
  late final int id;
  
  Customer.fromJson(Map<String, dynamic> json){
    customerName = json['customer_name'];
    mykadNumber = json['mykad_number'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customer_name'] = customerName;
    _data['mykad_number'] = mykadNumber;
    _data['user_id'] = userId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}
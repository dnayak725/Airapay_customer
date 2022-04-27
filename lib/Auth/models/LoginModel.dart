class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.token,
    required this.userDetails,
  });
  late String status;
  late String message;
  late String token;
  late UserDetails userDetails;
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.email,
    required this.emailVerificationToken,
    required this.emailIsVerified,
    required this.phoneNumber,
    required this.sessionToken,
    required this.userType,
    required this.statusId,
    required this.referredBy,
    required this.referCode,
    required this.isVerified,
    required this.isSuspended,
    required this.deviceId,
    required this.isNotificationEnable,
    required this.customerName,
    required this.profilePhoto,
    required this.getIntrestCategory,
  });
  late int id;
  late String email;
  late String emailVerificationToken;
  late int emailIsVerified;
  late String phoneNumber;

  late String sessionToken;
  late String userType;
  late int statusId;
  late int referredBy;
  late int referCode;
  late int isVerified;
  late int isSuspended;
  late int deviceId;
  late int isNotificationEnable;
  late String customerName;
  late String profilePhoto;
  late List<GetintrestCategory> getIntrestCategory;
}

class GetintrestCategory {
  GetintrestCategory({
    required this.intrestCatId,
  });

  late int intrestCatId;
}

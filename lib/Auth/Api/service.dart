import 'dart:convert';
import 'dart:io';

import 'package:aira_pay/Auth/models/CompleteRegisterModel.dart';
import 'package:aira_pay/Auth/models/ExistNumberModel.dart';
import 'package:aira_pay/Auth/models/ForgotPasswordOtpSendModel.dart';
import 'package:aira_pay/Auth/models/ForgotPasswordOtpVerifyModel.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Auth/models/OtpSendModel.dart';
import 'package:aira_pay/Auth/models/UpdatePassword.dart';
import 'package:aira_pay/Auth/models/otpVerifyModel.dart';
import 'package:aira_pay/config/project_config.dart';

import 'package:http/http.dart' as http;

// check phone number
// Future<ExistPhoneNumber> checknumber(context, number) async {
//   late ExistPhoneNumber result;

//   try {
//     final response = await http.post(
//       Uri.parse(
//           "https://airapay-ext.quocent.com/mobile/api/v1/check_phone_number"),
//       headers: {
//         HttpHeaders.contentTypeHeader: "application/json",
//       },
//       body: jsonEncode({
//         'phone_number': number,
//       }),
//     );
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       result = ExistPhoneNumber.fromJson(data);
//     } else {
//       print("something went wrong");
//     }
//   } catch (e) {
//     print(e);
//   }
//   return result;
// }
// mobile number exist
class ExistNumberApiService {
  Future<ExistPhoneNumber> existnumber(Map<String, dynamic> param) async {
    String url =
        "https://airapay-ext.quocent.com/mobile/api/v1/check_phone_number";

    final response = await http.post(Uri.parse(url), body: param);
    print("hii");
    final data = jsonDecode(response.body);
    print(response);
    if (response.statusCode == 200) {
      return ExistPhoneNumber.fromJson(data);
    } else {
      return ExistPhoneNumber.fromError(data);
    }
  }
}

// login response
// Future<LoginModel> login(context, number) async {
//   late LoginModel result;

//   try {
//     final response = await http.post(
//       Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/user_login"),
//       // headers: {
//       //   HttpHeaders.contentTypeHeader: "application/json",
//       // },
//       body: (number),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       if (data['status'] == "sucess") {
//         result = LoginModel.fromJson(data);
//       } else {
//         result = LoginModel.fromError(data);
//       }
//     } else {
//       print("something went wrong");
//     }
//   } catch (e) {
//     print(e);
//   }
//   return result;
// }

// otp send
// Future<OtpSendModel> otpsend(context, number) async {
//   late OtpSendModel result;

//   try {
//     final response = await http.post(
//       Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/send_otp"),
//       // headers: {
//       //   HttpHeaders.contentTypeHeader: "application/json",
//       // },
//       body: jsonEncode({
//         'phone_number': number,
//       }),
//     );
//     print(number);
//     print(response.body);
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       result = OtpSendModel.fromJson(data);
//     } else {
//       print("something went wrong");
//     }
//   } catch (e) {
//     print(e);
//   }
//   return result;
// }
// otp send
class OptSendApiService {
  Future<OtpSendModel> otpsend(Map<String, dynamic> param) async {
    String url = "https://airapay-ext.quocent.com/mobile/api/v1/send_otp";

    final response = await http.post(Uri.parse(url), body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return OtpSendModel.fromJson(data);
    } else {
      return OtpSendModel.fromError(data);
    }
  }
}

// otp verify
class OptVerifyApiService {
  Future<VerifyOtpModel> otpverify(Map<String, dynamic> param) async {
    String url = ApiLinks().checkOtp;

    final response = await http.post(Uri.parse(url), body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return VerifyOtpModel.fromJson(data);
    } else {
      return VerifyOtpModel.fromError(data);
    }
  }
}

// complete registration
class CompleteRegisterApiService {
  Future<CompleteRegisterModel> completeregister(
      Map<String, dynamic> param) async {
    String url = "https://airapay-ext.quocent.com/mobile/api/v1/registration";

    final response = await http.post(Uri.parse(url), body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
        print(response.body);
      return CompleteRegisterModel.fromJson(data);
    } else {
      return CompleteRegisterModel.fromError(data);
    }
  }
}

// forgot password otp send
class ForgotOtpSendApiService {
  Future<ForgotPasswordSendOtp> forgototpsend(
      Map<String, dynamic> param) async {
    String url =
        "https://airapay-ext.quocent.com/mobile/api/v1/send_forgot_password_otp";

    final response = await http.post(Uri.parse(url), body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ForgotPasswordSendOtp.fromJson(data);
    } else {
      return ForgotPasswordSendOtp.fromError(data);
    }
  }
}

// forgot otp verify
class ForgotOptVerifyApiService {
  Future<ForgotVerifyOtpModel> forgototpverify(
      Map<String, dynamic> param) async {
    String url =
        "https://airapay-ext.quocent.com/mobile/api/v1/verify_forgot_password_otp";

    final response = await http.post(Uri.parse(url), body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ForgotVerifyOtpModel.fromJson(data);
    } else {
      return ForgotVerifyOtpModel.fromError(data);
    }
  }
}

// updatePassword
class UpdatePasswordApiService {
  Future<UpdatePasswordModel> updatepassword(Map<String, dynamic> param) async {
    String url =
        "https://airapay-ext.quocent.com/mobile/api/v1/password_update";

    final response = await http.post(Uri.parse(url), body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
       print(response.statusCode);
      return UpdatePasswordModel.fromJson(data);
    } else {
      return UpdatePasswordModel.fromError(data);
    }
  }
}

import 'dart:convert';

import 'package:aira_pay/Account/Models/UpdateModel.dart';
import 'package:http/http.dart' as http;

// updatePassword
class UpdateProfileApiService {
  Future<UpdateProfileModel> updateprofile(Map<String, dynamic> param) async {
    String url = "https://airapay-ext.quocent.com/mobile/api/v1/profile-update";
    var request = new http.MultipartRequest("POST", Uri.parse(url))
      ..fields['token'] = param["token"]
      ..fields['user_id'] = param["user_id"]
      ..fields['customer_name'] = param["customer_name"]
      ..fields['gender'] = param["gender"]
      ..fields['email'] = param["email"]
      ..files.add(await http.MultipartFile.fromPath(
          'profile_picture', param["profile_picture"]));
    // final response = await http.post(Uri.parse(url), body: param);
    // print(response.body);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final data = jsonDecode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      return UpdateProfileModel.fromJson(data);
    } else {
      return UpdateProfileModel.fromError(data);
    }
  }
}

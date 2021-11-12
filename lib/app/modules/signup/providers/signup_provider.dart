import 'dart:convert';

import 'package:domain_lists/app/modules/signup/model/signup_error_model.dart';
import 'package:domain_lists/app/modules/signup/model/signup_model.dart';
import 'package:domain_lists/app/utils/api_link.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupProvider extends GetConnect {
  Future<dynamic> signUp(String address, String password) async {
    var url =
        Uri.parse('${ApiLink.API_LINK}accounts');
    Map<String, dynamic> body = {
      "address": address,
      "password": password
    };

    final response = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});

    print(response.statusCode);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignupModel.fromJson(jsonData);
    } else if (response.statusCode == 400 || response.statusCode == 422 ){
      return SignupErrorModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

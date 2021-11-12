import 'dart:convert';

import 'package:domain_lists/app/modules/signin/model/signin_model.dart';
import 'package:domain_lists/app/utils/api_link.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SigninProvider extends GetConnect {
   Future<SigninModel?> signIn(String address, String password) async {
    var url =
        Uri.parse('${ApiLink.API_LINK}token');
    Map<String, dynamic> body = {
      "address": address,
      "password": password
    };

    final response = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});

    print(response.statusCode);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      return SigninModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

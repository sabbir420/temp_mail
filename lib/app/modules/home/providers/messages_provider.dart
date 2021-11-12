import 'dart:convert';

import 'package:domain_lists/app/modules/home/model/messages_list_model.dart';
import 'package:domain_lists/app/utils/api_link.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MessagesProvider extends GetConnect {
  Future<MessagesListModel?> getMessagesData(var token) async {
    final response = await http.get(
        Uri.parse(
            "${ApiLink.API_LINK}messages"),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        });
        
    print(response.statusCode);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return MessagesListModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

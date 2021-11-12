import 'dart:convert';

import 'package:domain_lists/app/modules/signup/model/domain_list_model.dart';
import 'package:domain_lists/app/utils/api_link.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DomainListProvider extends GetConnect {
  Future<DomainListModel?> getDomains() async {
    var url =
        Uri.parse('${ApiLink.API_LINK}domains');

    final response = await http.get(url, headers: {"Content-Type": "application/json"});

    print(response.statusCode);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return DomainListModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

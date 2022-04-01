import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  static Future<dynamic> getUser() async {
    var apiResult = await http.get(
        Uri.parse("https://reqres.in/api/users?per_page=14"),
        headers: {"Content-Type": "application/json"});
    var jsonObject = json.decode(apiResult.body);
    return jsonObject;
  }
}

import 'dart:convert';
import 'package:login_cubit_simple/core/api_links.dart';
import 'package:http/http.dart' as http;

class LoginDataSource {
  String? token;

  Future<void> login(String email, String password) async {
    final loginUrl = Uri.parse(baseUrl);
    final body = {"email": email, "password": password};

    final response = await http.post(loginUrl, body: body);

    dynamic responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return token = responseData['token'];
    }
    throw Exception(responseData['error']);
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://feeds.ppu.edu/user/register'), 
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

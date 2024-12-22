import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://676816de596c3eca48a375a0.mockapi.io';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.get(Uri.parse('$baseUrl/users?email=$email'));

    if (response.statusCode == 200) {
      final List users = jsonDecode(response.body);
      if (users.isNotEmpty) {
        final user = users.first;
        if (user['password'] == password) {
          return user;
        } else {
          throw Exception('Incorrect password');
        }
      } else {
        throw Exception('Email not found');
      }
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  static Future<void> signUp(String username, String email, String password, String address, String phone) async {
    final checkResponse = await http.get(Uri.parse('$baseUrl/users?email=$email'));

    if (checkResponse.statusCode == 200) {
      final List users = jsonDecode(checkResponse.body);
      if (users.isNotEmpty) {
        throw Exception('Email already exists');
      }

      final postResponse = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password,
          'address': address,
          'phone': phone,
        }),
      );

      if (postResponse.statusCode != 201) {
        throw Exception('Failed to sign up');
      }
    } else {
      throw Exception('Failed to check email');
    }
  }
}

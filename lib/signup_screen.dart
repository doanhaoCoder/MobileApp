import 'package:flutter/material.dart';
import 'package:Shop_KT/services/api_service.dart'; // Thêm lớp dịch vụ

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> signUp() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final address = _addressController.text.trim();
    final phone = _phoneController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty || address.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Vui lòng điền đầy đủ thông tin.")),
      );
      return;
    }

    try {
      await ApiService.signUp(username, email, password, address, phone);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Đăng ký thành công!")),
      );
      _usernameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _addressController.clear();
      _phoneController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Đã có lỗi xảy ra: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Đăng ký")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: Text("Đăng ký"),
            ),
          ],
        ),
      ),
    );
  }
}

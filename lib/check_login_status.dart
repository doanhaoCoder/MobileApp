import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Shop_KT/Home.dart'; // Trang Home
import 'package:Shop_KT/login_screen.dart'; // Trang Login

class CheckLoginStatus extends StatefulWidget {
  const CheckLoginStatus({Key? key}) : super(key: key);

  @override
  State<CheckLoginStatus> createState() => _CheckLoginStatusState();
}

class _CheckLoginStatusState extends State<CheckLoginStatus> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Hàm kiểm tra trạng thái đăng nhập
  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Điều hướng dựa trên trạng thái đăng nhập
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // Hiển thị trong khi kiểm tra trạng thái
      ),
    );
  }
}

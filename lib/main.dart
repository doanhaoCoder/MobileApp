
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:Shop_KT/MyHttp.dart';
import 'check_login_status.dart'; // Import tệp kiểm tra trạng thái đăng nhập

void main() {
  HttpOverrides.global = MyHttp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CheckLoginStatus(), // Gọi trang kiểm tra trạng thái đăng nhập
    );
  }
}

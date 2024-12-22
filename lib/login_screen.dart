import 'package:flutter/material.dart';
import 'package:Shop_KT/signup_screen.dart';
import 'package:Shop_KT/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Shop_KT/services/api_service.dart'; // Thêm lớp dịch vụ

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _login(BuildContext context, String email, String password) async {
    try {
      final user = await ApiService.login(email, password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', user['id'] ?? '');
      await prefs.setString('username', user['username'] ?? '');
      await prefs.setString('email', user['email'] ?? '');
      await prefs.setString('address', user['address'] ?? '');
      await prefs.setString('phone', user['phone'] ?? '');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to login: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hình nền hoặc hình ảnh ở trên
            Image.asset(
              "assets/images/bg.png", // Đảm bảo file hình ảnh tồn tại trong thư mục assets
              fit: BoxFit.cover,
              width: double.infinity,
              height: size.height * 0.3, // Chiều cao chiếm 30% màn hình
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome KT-Shop!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16.0),
                  const Text(
                    "Log in with your account.",
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  const SizedBox(height: 24.0),
                  // Form đăng nhập
                  TextFormField(
                    controller: emailController, // Thêm controller cho email
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController, // Thêm controller cho password
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Hành động cho "Quên mật khẩu"
                      },
                      child: const Text("Forgot password?"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Nút Đăng Nhập
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _login(context, emailController.text, passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfffd723b), // Màu nền nút
                        foregroundColor: Colors.white, // Màu chữ
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0), // Padding dọc cho nút
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Bo tròn góc nút
                        ),
                      ),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 16, // Kích thước chữ
                          fontWeight: FontWeight.bold, // Độ đậm chữ
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Liên kết tới đăng ký
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text("Sign up"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

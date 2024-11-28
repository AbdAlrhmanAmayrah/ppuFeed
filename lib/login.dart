import 'package:flutter/material.dart';
import 'auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 37, 52, 77), // تغيير اللون الخلفي ليكون أزرق فاتح
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // إضافة الشعار هنا
            Image.asset(
              'assets/images/ppulogo.png', // مسار الشعار
              height: 100, // ارتفاع الشعار
              width: 100, // عرض الشعار
            ),
            SizedBox(height: 20),
            Text(
              'Login to PPU Feed',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black, // اللون الأسود للنص
              ),
            ),
            SizedBox(height: 20),

            // Label for Email
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // اللون الأسود للنص
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter your email',
                hintStyle:
                    TextStyle(color: Colors.black), // اللون الأسود لتلميح النص
              ),
              style: TextStyle(
                  color: Colors.black), // النص داخل الـ TextField باللون الأسود
            ),
            SizedBox(height: 20),

            // Label for Password
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // اللون الأسود للنص
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter your password',
                hintStyle:
                    TextStyle(color: Colors.black), // اللون الأسود لتلميح النص
              ),
              obscureText: true,
              style: TextStyle(
                  color: Colors.black), // النص داخل الـ TextField باللون الأسود
            ),
            SizedBox(height: 20),

            // عرض زر الدخول أو مؤشر التحميل
            _isLoading
                ? CircularProgressIndicator(
                    color: Colors.black, // اللون الأسود لمؤشر التحميل
                  )
                : ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black), // اللون الأسود للنص
                    ),
                  ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                print("Navigate to registration page");
              },
              child: Text(
                'Don\'t have an account? Register here',
                style: TextStyle(
                  color: Colors.black, // اللون الأسود للراب
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    bool success = await _authService.login(email, password);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      print('Login successful');
    } else {
      setState(() {
        _errorMessage = 'Login failed. Please check your credentials.';
      });
    }
  }
}

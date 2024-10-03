import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usname = "";
  String pass = "";
  bool statusLogin = false;
  bool _obscureText = true; // For password visibility toggle

  Widget _usnameField() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white.withOpacity(0.8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          onChanged: (value) {
            usname = value;
          },
          decoration: const InputDecoration(
            hintText: 'Username',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.person), // Icon for username
          ),
        ),
      ),
    );
  }

  Widget _passField() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white.withOpacity(0.8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          obscureText: _obscureText,
          onChanged: (value) {
            pass = value;
          },
          decoration: InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.lock), // Icon for password
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  void _checkLog() {
    if (usname == "Silvia" && pass == "123") {
      statusLogin = true;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DashboardPage(usname: usname)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Gagal"),
        ),
      );
    }
  }

  Widget _buttonLog() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ElevatedButton(
        onPressed: _checkLog,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE0BBE4), // Pastel purple
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: const Color(0xFFE0BBE4), // Pastel purple
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFD1DC), // Light pink
              Color(0xFFFAF4B7), // Light yellow
              Color(0xFFE0BBE4), // Soft purple
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _usnameField(),
                _passField(),
                _buttonLog(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

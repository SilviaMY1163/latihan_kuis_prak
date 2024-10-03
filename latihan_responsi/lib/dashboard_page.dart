import 'package:flutter/material.dart';
import 'menu_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.usname});
  final String usname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Page"),
        automaticallyImplyLeading: false,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Selamat Datang $usname",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(usname: usname),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE0BBE4), // Pastel purple
                ),
                child: const Text("Menu"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

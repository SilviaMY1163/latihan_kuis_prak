import 'package:flutter/material.dart';
import 'dummy_menu.dart';
import 'detail_page.dart'; // Import the detail page

class MenuPage extends StatelessWidget {
  final String usname;

  const MenuPage({super.key, required this.usname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Page"),
        backgroundColor: const Color(0xFFFFE3B3), // Soft pastel color for the app bar
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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65, // Adjusted aspect ratio for card size
          ),
          itemCount: foodMenuList.length,
          itemBuilder: (context, index) {
            final FoodMenu menu = foodMenuList[index];
            return Card(
              color: const Color(0xFFFFF5E1), // Cream color for the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content
                children: [
                  // Center image
                  SizedBox(
                    height: 80, // Set height for image to make the card smaller
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        menu.imageUrls[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Center text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Text(
                          menu.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          menu.category,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          menu.price,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(menu: menu),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE3B3), // Soft pastel color for button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Detail"),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

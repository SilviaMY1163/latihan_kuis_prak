import 'package:flutter/material.dart';
import 'dummy_menu.dart';

class DetailPage extends StatelessWidget {
  final FoodMenu menu;

  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
        backgroundColor: const Color(0xFFFFE3B3), // Soft pastel color for AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF5E1), // Soft pastel color for background
        ),
        child: Center(
          child: Card(
            color: const Color(0xFFFFF9E5), // Cream color for the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjust size to content
                children: [
                  // Center image
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      menu.imageUrls[0],
                      fit: BoxFit.cover,
                      height: 150, // Fixed height for the image
                      width: double.infinity, // Full width for the image
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Title
                  Text(
                    menu.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    menu.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  // Ingredients
                  Text(
                    'Ingredients: ${menu.ingredients}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  // Cooking Time
                  Text(
                    'Cooking Time: ${menu.cookingTime}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  // Category and Price
                  Text(
                    menu.category,
                    style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    menu.price,
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

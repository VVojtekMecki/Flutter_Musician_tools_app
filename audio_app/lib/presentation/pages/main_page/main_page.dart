import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Musician's Craftsmanship",
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  // Add any other custom styles you prefer
                ),
              ),
            ),
            const SizedBox(height: 8), // Increase the spacing between the headline and the text below
            const Text(
              "Schedule your practice routine",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "With:",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32), // Increase the spacing between the headline and the buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/playback');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  elevation: 4, // Add a shadow to the button
                  // Add any other custom styles you prefer
                ),
                child: const Text(
                  "Backing tracks",
                  style: TextStyle(
                    fontSize: 18,
                    // Add any other custom styles you prefer
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Increase the spacing between the buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notes');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  elevation: 4, // Add a shadow to the button
                  // Add any other custom styles you prefer
                ),
                child: const Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 18,
                    // Add any other custom styles you prefer
                  ),
                ),
              ),
            ),
          ],
        ),
      ),



    );
  }
}

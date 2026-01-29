import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Better",
                style: TextStyle(
                  color: Color.fromARGB(218, 209, 54, 54),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(218, 209, 54, 54),
                ),
                child: const Text(
                  "Apply now",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.menu,
                  color: const Color.fromARGB(218, 209, 54, 54),
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

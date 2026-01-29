import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
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
                const SizedBox(width: 16),
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
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 50),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),

                  children: [
                    TextSpan(text: "Changing the finance for the "),
                    TextSpan(
                      text: "better",
                      style: TextStyle(color: Color.fromARGB(218, 209, 54, 54)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Fast Smart Fair",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(228, 67, 66, 66),
                ),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity, // makes the button full width
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(218, 209, 54, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // adjust corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ), // button height
                ),
                child: const Text(
                  "Apply Now",
                  style: TextStyle(
                    color: Color.fromARGB(218, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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

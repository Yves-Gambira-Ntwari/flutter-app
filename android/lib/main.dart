import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

@override
void dispose() {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Centered login form
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Login here",
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Email input
                        TextField(
                          // controller: emailContoller,
                          decoration: InputDecoration(
                            labelText: 'Enter your Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Password input
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Enter your Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Login button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            print("Login pressed");
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Forget Password link at left-center
            Align(
              alignment: Alignment.centerLeft, // left and vertically centered
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    print("Forget Password clicked");
                  },
                  child: const Text(
                    "Forget Password",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
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

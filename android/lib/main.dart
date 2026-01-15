import 'package:android/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final _formKey = GlobalKey<FormState>();

String name = '';
String email = '';
String password = '';

@override
void dispose() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Email input
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter your Email",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Password input
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Enter your Password',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              name = value!;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Login button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                print(name);
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
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

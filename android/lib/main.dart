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
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 65, 157, 233),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 300,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.5),
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: // Email input
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter your Email", 
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Password input
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.5),
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Enter your Password',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
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
                          ),

                          const SizedBox(height: 30),

                          // Login button
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Material(
                              borderRadius: BorderRadius.circular(40),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 50, 123, 168),
                                      Color.fromARGB(255, 103, 180, 228),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.4),
                                      blurRadius: 40,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),

                                child: InkWell(
                                  borderRadius: BorderRadius.circular(40),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      print(name);
                                    }
                                  },
                                  child: const SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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

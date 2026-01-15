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
                          Material(
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
                                    color: Colors.blue,
                                    blurRadius: 40,
                                    offset: Offset(0, 50),
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

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // <-- add this
import 'dart:convert'; // <-- add this
import 'package:android/home_page.dart';

void main() {
  runApp(const MyApp());
}

/// ROOT APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

/// LOGIN PAGE
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool rememberMe = false;

  Future<void> _login() async {
    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:4000/login"), // Android Emulator
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Example: data might contain { "token": "...", "user": {...} }
        print("Login success: $data");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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

              const SizedBox(height: 40),

              SizedBox(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// EMAIL
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter your Email",
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'This field is required'
                            : null,
                        onSaved: (value) => email = value!,
                      ),

                      const SizedBox(height: 20),

                      /// PASSWORD
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Enter your Password",
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'This field is required'
                            : null,
                        onSaved: (value) => password = value!,
                      ),

                      const SizedBox(height: 20),

                      /// REMEMBER ME
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          const Text("Remember Me"),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _login(); // <-- call backend
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

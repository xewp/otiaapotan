import 'package:floodpath/constants.dart';
import 'package:floodpath/screens/login/login_number.dart';
import 'package:floodpath/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_dialogs.dart';
import 'package:floodpath/widget/custom_button.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true; // Toggle password visibility
  bool _showError = false; // Toggle error message visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: FADING_BLUE_GRADIENT, // Apply the fading blue gradient
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent, // Make AppBar blend with gradient
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome back,\nEnter your email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
  controller: emailController,
  textAlign: TextAlign.center,
  hintText: 'Email',
  fontSize: 20,
  contentPadding: EdgeInsets.symmetric(vertical: 16),
  keyboardType: TextInputType.emailAddress, // <-- Add this line
),

                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
  obscureText: _obscureText,
  keyboardType: TextInputType.visiblePassword, // 👈 Add this line
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    hintText: 'Password',
    hintStyle: const TextStyle(color: Colors.white54),
    filled: true,
    fillColor: Colors.white.withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,

                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText; // Toggle visibility
                            });
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _showError, // Show error message only if _showError is true
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Password must be 'password'", // Red error text
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red, // Red color for error message
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        // Validate email and password
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();

                        if (_isValidEmail(email) && password == "password") {
                          // If valid, navigate to MainScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainScreen()),
                          );
                        } else {
                          // If invalid, show error message and custom dialog
                          setState(() {
                            _showError = true; // Show error message
                          });
                          customDialog(
                            context,
                            title: 'Invalid Input',
                            content: 'Please enter a valid email and the correct password.',
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                   // Replace the GestureDetector for "Sign in with phone number" with:
GestureDetector(
  onTap: () {
    // Replace current screen with phone login
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const NumberLogin(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  },
  child: const Text(
    'Sign in with phone number',
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.yellow, fontSize: 18),
  ),
),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to validate email format
  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
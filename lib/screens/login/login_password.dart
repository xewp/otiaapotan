import 'package:floodpath/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart'; // Import your constants
import 'package:floodpath/widget/custom_dialogs.dart'; // Import your custom_dialogs.dart

class PasswordLogin extends StatefulWidget {
  const PasswordLogin({Key? key}) : super(key: key);

  @override
  _PasswordLoginState createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  bool _obscureText = true; // Toggle password visibility
  bool _showError = false; // Toggle error message visibility
  final TextEditingController _passwordController = TextEditingController(); // Controller for password input

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
            const SizedBox(height: 20), // Spacing below AppBar
            const Text(
              "Welcome back,\nEnter your password",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 30), // Spacing below the title
            TextFormField(
              controller: _passwordController, // Add controller for password input
              obscureText: _obscureText, // Toggle password visibility
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1), // Semi-transparent background
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
            const Spacer(), // Spacing above the button
            CustomButton(
              text: 'Continue',
              onPressed: () {
                // Validate password
                String password = _passwordController.text.trim();
                if (password == "password") {
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
                    title: 'Invalid Password',
                    content: 'Please enter the correct password.',
                  );
                }
              },
            ),
            const SizedBox(height: 20), // Spacing above the text link
            GestureDetector(
              onTap: () {
                // Handle "Forgot password?" action
              },
              child: const Text(
                "Forgot password?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.yellow, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),],),));
  }
}
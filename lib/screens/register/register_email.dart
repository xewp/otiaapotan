import 'package:floodpath/screens/register/register_name.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart';
import 'package:floodpath/widget/custom_dialogs.dart'; // Import your custom_dialogs.dart

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: FADING_BLUE_GRADIENT, // Use the defined gradient
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent, // Make the AppBar blend with the gradient
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
                     Text(
                      "Let's connect it to your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      controller: emailController, // Add controller
                      textAlign: TextAlign.center,
                      hintText: 'Email',
                      fontSize: 20,
                      keyboardType: TextInputType.text	,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    const Spacer(),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        // Validate email
                        String email = emailController.text.trim();
                        if (_isValidEmail(email)) {
                          // If valid, navigate to RegisterName
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const RegisterName(),
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
                        } else {
                          // If invalid, show error dialog
                          customDialog(
                            context,
                            title: 'Invalid Email',
                            content: 'Please enter a valid email address.',
                          );
                        }
                      },
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

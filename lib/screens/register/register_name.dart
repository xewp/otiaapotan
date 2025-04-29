import 'package:floodpath/screens/register/join_group.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart';
import 'package:floodpath/widget/custom_dialogs.dart'; // Import your custom_dialogs.dart

class RegisterName extends StatelessWidget {
  const RegisterName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();

    return Scaffold(
  body: Container(
    decoration: const BoxDecoration(
      gradient: FADING_BLUE_GRADIENT, // Use the fading blue gradient
    ),
    child: Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent, // Blend AppBar with gradient
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
                 Text(
                  "Input your name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
            const SizedBox(height: 40), // Spacing below the title
            CustomTextFormField(
              controller: firstNameController, // Add controller for first name
              hintText: 'First Name',
              keyboardType: TextInputType.text	,
              fontSize: 20,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(height: 30), // Spacing between input fields
            CustomTextFormField(
              controller: lastNameController, // Add controller for last name
              hintText: 'Last Name',
              fontSize: 20,
              keyboardType: TextInputType.text	,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              textAlign: TextAlign.center, // Center the text
            ),
            const Spacer(), // Push the button to the bottom
            CustomButton(
              text: 'Continue',
              onPressed: () {
                // Validate first name and last name
                String firstName = firstNameController.text.trim();
                String lastName = lastNameController.text.trim();

                if (firstName.isEmpty || lastName.isEmpty) {
                  // If either field is empty, show error dialog
                  customDialog(
                    context,
                    title: 'Missing Information',
                    content: 'Please enter both your first name and last name.',
                  );
                } else {
                  // If both fields are filled, navigate to JoinGroup
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const JoinGroup(),
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
                }
              },
            ),
          ],
        ),
      ),
        ),
      ])
    ),

      );

  }
}
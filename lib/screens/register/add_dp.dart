// ignore_for_file: deprecated_member_use

import 'package:floodpath/screens/register/register_home.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart'; // Import your constants
// ignore: unused_import
import 'package:floodpath/screens/main_screen.dart';

class AddDisplayPicture extends StatelessWidget {
  const AddDisplayPicture({super.key});

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
              "Add Display Picture",
              textAlign: TextAlign.center,
              style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
            ),
            const SizedBox(height: 10), // Spacing below the title
            const Text(
              "This will help your group easily find and recognize members on the map.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 30), // Spacing below the description
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1), // Semi-transparent background
                  borderRadius: BorderRadius.circular(75), // Circular shape
                ),
                child: IconButton(
                  icon: const Icon(Icons.person_4, size: 50, color: Colors.white),
                  onPressed: () {
                    // Handle add/edit photo
                  },
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing below the photo container
            CustomButton(
              text: 'Add photo',
              onPressed: () {
                // Handle add photo
              },
             
            ),
            const SizedBox(height: 10), // Spacing between buttons
            CustomButton(
              text: 'Edit photo',
              onPressed: () {
                // Handle edit photo
              },
 // White text color
            ),
            const Spacer(), // Spacing above the continue button
            CustomButton(
              text: 'Continue',
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const RegHome(),
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
                // Handle continue button press
              },
 
            ),
          ],
        ),
      ),
       )],),) );
  }
}
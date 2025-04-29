import 'package:floodpath/screens/register/add_dp.dart';
import 'package:floodpath/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart'; // Import your constants

class GroupInv extends StatelessWidget {
  final String inviteCode; // Add inviteCode as a parameter

  const GroupInv({Key? key, required this.inviteCode}) : super(key: key);

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
            const SizedBox(height: 50), // Spacing from the top
            const Text(
              "You are",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),// Spacing below the title
            const Text(
              "Invited to join",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
 // Spacing below the subtitle
            Text(
              inviteCode, // Use inviteCode in the text
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30), // Spacing below the invite code
            const Icon(
              Icons.person_3_outlined, // Person icon
              size: 100, // Larger icon size
              color: Colors.white,
            ),
            const SizedBox(height: 30), // Spacing below the icon
            const Text(
              "You got invited by this user!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 70), // Spacing above the buttons
            CustomButton(
              text: 'Accept Invitation',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddDisplayPicture()),
                );
              },
            ),
            const SizedBox(height: 60), // Spacing between buttons
            CustomButton(
              text: 'Decline Invitation',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
        )
      ],),),
    );
  }
}
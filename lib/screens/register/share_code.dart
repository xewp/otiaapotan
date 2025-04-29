import 'package:floodpath/screens/register/get_roles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart'; // Import your constants

class ShareCode extends StatelessWidget {
  final String groupName; // Add groupName as a parameter

  const ShareCode({Key? key, required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Received Group Name: $groupName"); // Debug print
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
              "Share this invite code for", // First part of the text
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 10), // Spacing between the two texts
            Text(
              groupName, // Group name in bold
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32, // Larger font size for the group name
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            const SizedBox(height: 30), // Spacing below the title
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Semi-transparent background
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "ASD-ASD",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32, // Larger font size for the invite code
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Copy the invite code to the clipboard
                Clipboard.setData(const ClipboardData(text: "ASD-ASD"));
                // Show a snackbar to confirm the code has been copied
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invite code copied to clipboard!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                "Copy Code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 17, // Larger font size for the invite code
                ),
              ),
            ),
            const Spacer(), // Spacing above the button
            CustomButton(
              text: 'Continue',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectRole()),
                );
              },
            ),
          ],
        ),
      ),
    ),],),));
  }
}
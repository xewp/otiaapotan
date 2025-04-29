import 'package:floodpath/screens/register/create_group.dart';
import 'package:floodpath/screens/register/group_inv.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart'; // Import your constants
import 'package:floodpath/widget/custom_dialogs.dart'; // Import your custom_dialogs.dart

class JoinGroup extends StatelessWidget {
  const JoinGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController inviteCodeController = TextEditingController();

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
              "Join a Group! Enter the invite code",
              textAlign: TextAlign.center,
              style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
            ),
            const SizedBox(height: 30), // Spacing below the title
            CustomTextFormField(
              controller: inviteCodeController, // Add controller for invite code
              hintText: 'Enter invite code',
              fontSize: 18,
              keyboardType: TextInputType.text	,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(height: 20), // Spacing above the button
            CustomButton(
              text: 'Enter',
              onPressed: () {
                // Validate invite code
                String inviteCode = inviteCodeController.text.trim();
                if (inviteCode.isNotEmpty) {
                  // If valid, navigate to GroupInv and pass the inviteCode
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupInv(inviteCode: inviteCode), // Pass inviteCode
                    ),
                  );
                } else {
                  // If invalid, show error dialog
                  customDialog(
                    context,
                    title: 'Invite Code Required',
                    content: 'Please enter an invite code.',
                  );
                }
              },
            ),
            const SizedBox(height: 20), // Spacing above the divider
            const Divider(
              color: Colors.white54, // Color of the divider
              thickness: 1, // Thickness of the divider
            ),
            const SizedBox(height: 20),
            const Text(
              "Don't have a group?",
              textAlign: TextAlign.center,
              style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
            ), // Spacing below the divider
            const SizedBox(height: 50),
            CustomButton(
              text: "Create a new group",
              onPressed: () {
                // Navigate to CreateGroup screen
                Navigator.push(
                  context,
                  PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const CreateGroup(),
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
                            ), // Use const
                );
              },
            ),
          ],
        ),
      ),
  )],), 
      ), 
      );
  }
}
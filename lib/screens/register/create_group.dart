import 'package:floodpath/screens/register/share_code.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart';
import 'package:floodpath/widget/custom_dialogs.dart'; // Import your custom_dialogs.dart

class CreateGroup extends StatelessWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController groupNameController = TextEditingController();

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
              "Name your Group",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              controller: groupNameController, // Add controller for group name
              textAlign: TextAlign.center,
              hintText: 'Group Name',
              fontSize: 20,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
            ),
            const Spacer(),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                // Validate group name
                String groupName = groupNameController.text.trim();
                print("Group Name: $groupName"); // Debug print
                if (groupName.isNotEmpty) {
                  // If valid, navigate to ShareCode and pass the groupName
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShareCode(groupName: groupName), // Pass groupName
                    ),
                  );
                } else {
                  // If invalid, show error dialog
                  customDialog(
                    context,
                    title: 'Group Name Required',
                    content: 'Please enter a name for your group.',
                  );
                }
              },
            ),
          ],
        ),
      ),
    ),],),));
  }
}
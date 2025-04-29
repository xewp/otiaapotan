import 'package:floodpath/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/constants.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/widget/custom_dialogs.dart'; // Import your custom_dialogs.dart

class RegHome extends StatelessWidget {
  const RegHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController labelController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // **Top Section: Gradient Background**
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: FADING_BLUE_GRADIENT, // Matches `ShareCode`
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // **Back Button (Same as ShareCode)**
                // **Updated Back Button to Match ShareCode**
                Align(
                  alignment: Alignment.centerLeft, // Ensure alignment is the same as in ShareCode
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30, // Adjust size if needed
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // **Title (Same as ShareCode)**
                const Text(
                  "Add your Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 35),
                // **Label Text Field**
                CustomTextFormField(
                  controller: labelController,
                  hintText: 'Label',
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
                const SizedBox(height: 35),
                // **Address Text Field**
                CustomTextFormField(
                  controller: addressController,
                  hintText: 'Address',
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),

          // **Drag to Adjust Location (Like ShareCode)**
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color.fromARGB(255, 38, 55, 78),
            child: const Center(
              child: Text(
                "Drag the map to adjust and get a more precise location.",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
              ),
            ),
          ),

          // **Map Placeholder (Same Layout as ShareCode)**
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map_placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // **Save Button (Same as ShareCode)**
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomButton(
              text: 'Save',
              onPressed: () {
                // Validate inputs
                String label = labelController.text.trim();
                String address = addressController.text.trim();

                if (label.isEmpty || address.isEmpty) {
                  // Show error dialog if any field is empty
                  customDialog(
                    context,
                    title: 'Missing Information',
                    content: 'Please fill in both Label and Address.',
                  );
                } else {
                  // If all fields are filled, navigate to MainScreen
                  Navigator.push(
                    context,
         PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const MainScreen(),
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
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
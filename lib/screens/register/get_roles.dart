import 'package:floodpath/screens/register/add_dp.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/constants.dart';
import 'package:floodpath/widget/custom_textformfield.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  _SelectRoleState createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  final List<String> roles = [
    'Dad',
    'Mom',
    'Son/Daughter/Child',
    'Grandparent',
    'Partner/Spouse',
    'Friend',
    'Other',
  ];

  String? selectedRole;
  final TextEditingController customRoleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: FADING_BLUE_GRADIENT,
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
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
                      "What is your role on this Group?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: ListView(
                        children: roles.map((role) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: CustomButton(
                              text: role,
                              onPressed: () {
                                setState(() {
                                  selectedRole = role;
                                });

                                if (role != 'Other') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddDisplayPicture()),
                                  );
                                }
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    if (selectedRole == 'Other') ...[
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        hintText: 'Enter your role',
                        controller: customRoleController,
                        fontSize: 18,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          if (customRoleController.text.trim().isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddDisplayPicture()),
                            );
                          }
                        },
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

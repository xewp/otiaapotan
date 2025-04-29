import 'package:floodpath/constants.dart';
import 'package:floodpath/screens/register/register_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_button.dart';
import 'package:floodpath/widget/custom_dialogs.dart';

class RegisterNumber extends StatefulWidget {
  const RegisterNumber({Key? key}) : super(key: key);

  @override
  _RegisterNumberState createState() => _RegisterNumberState();
}

class _RegisterNumberState extends State<RegisterNumber> {
  final List<String> countryCodes = ['+63', '+1', '+44', '+91'];
  String selectedCountryCode = '+63';
  final TextEditingController phoneController = TextEditingController();

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
                    Text(
                      "Let's begin by registering your number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCountryCode,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCountryCode = newValue!;
                              });
                            },
                            items: countryCodes
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              );
                            }).toList(),
                            underline: Container(),
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.white, size: 30),
                            dropdownColor: const Color(0xFF476A9F),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextFormField(
                            controller: phoneController,
                            hintText: '6051 8295',
                            fontSize: 20,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.phone
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        text: 'By clicking "Continue" you accept our ',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                                color: Colors.yellow, fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                customDialog(
                                  context,
                                  title: 'Privacy Policy',
                                  content: 'This is the Privacy Policy content.',
                                );
                              },
                          ),
                          const TextSpan(
                            text: ' and ',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: const TextStyle(
                                color: Colors.yellow, fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                customDialog(
                                  context,
                                  title: 'Terms of Service',
                                  content: 'This is the Terms of Service content.',
                                );
                              },
                          ),
                          const TextSpan(
                            text: '.',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        String phoneNumber =
                            phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
                        if (phoneNumber.length == 10) {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const RegisterEmail(),
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
                          customDialog(
                            context,
                            title: 'Invalid Phone Number',
                            content: 'Please enter a 10-digit phone number.',
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
}
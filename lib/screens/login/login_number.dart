import 'package:floodpath/constants.dart';
import 'package:floodpath/screens/login/login_email.dart';
import 'package:floodpath/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_textformfield.dart';
import 'package:floodpath/widget/custom_dialogs.dart';
import 'package:floodpath/widget/custom_button.dart';

class NumberLogin extends StatefulWidget {
  const NumberLogin({Key? key}) : super(key: key);

  @override
  _NumberLoginState createState() => _NumberLoginState();
}

class _NumberLoginState extends State<NumberLogin> {
  final List<String> countryCodes = ['+63', '+1', '+44', '+91'];
  String selectedCountryCode = '+63';
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _showError = false;

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
                      'Welcome back,\nEnter your number',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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
                            items: countryCodes.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              );
                            }).toList(),
                            underline: Container(),
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 28),
                            dropdownColor: const Color(0xFF476A9F),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextFormField(
                            controller: phoneController,
                            textAlign: TextAlign.left,
                            hintText: '93 6051 8295',
                            fontSize: 20,
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                            keyboardType: TextInputType.phone, // Set keyboard type to phone
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
  obscureText: _obscureText,
  keyboardType: TextInputType.visiblePassword, // 👈 Add this line
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    hintText: 'Password',
    hintStyle: const TextStyle(color: Colors.white54),
    filled: true,
    fillColor: Colors.white.withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,

                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _showError,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Password must be 'password'",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        String phoneNumber = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
                        String password = passwordController.text.trim();

                        if (phoneNumber.length == 10 && password == "password") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainScreen()),
                          );
                        } else {
                          setState(() {
                            _showError = true;
                          });
                          customDialog(
                            context,
                            title: 'Invalid Input',
                            content: 'Please enter a valid 10-digit phone number and the correct password.',
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                   // Replace the GestureDetector for "Sign in with email" with:
GestureDetector(
  onTap: () {
    // Replace current screen with email login
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const EmailLogin(),
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
  },
  child: const Text(
    'Sign in with email',
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.yellow, fontSize: 18),
  ),
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
import 'package:floodpath/screens/login/login_number.dart';
import 'package:floodpath/screens/login/login_email.dart';
import 'package:floodpath/screens/main_screen.dart';
import 'package:floodpath/screens/register/register_number.dart';
import 'package:floodpath/screens/welcome_screen.dart';
import 'package:floodpath/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/main': (context) => const MainScreen(),
        '/login_number': (context) => const NumberLogin(),
        '/login_email': (context) => const EmailLogin(),
        '/register_number': (context) => const RegisterNumber(),
      },
      // Optional: Custom page transitions
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            switch (settings.name) {
              case '/welcome':
                return const WelcomeScreen();
              case '/login_number':
                return const NumberLogin();
              case '/login_email':
                return const EmailLogin();
              case '/register_number':
                return const RegisterNumber();
              default:
                return const SplashScreen();
            }
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
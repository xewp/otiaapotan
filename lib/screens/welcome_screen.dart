import 'package:floodpath/screens/login/login_number.dart';
import 'package:floodpath/screens/main_screen.dart';
import 'package:floodpath/screens/register/register_number.dart';
import 'settings/account_settings.dart';
import 'package:flutter/material.dart';
import 'package:floodpath/widget/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> messages = [
    "Get real-time flood alerts and find safe places to go during heavy rain",
    "See flood risk estimates and river height check",
    "Receive simple predictions on possible flooding for better preparation",
  ];

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  static const _titleGradient = LinearGradient(
    colors: [
      Color(0xFF62B8C7),
      Color(0xFF185C7C),
      Color(0xFF003165),
      Color(0xFF151722),
    ],
    stops: [0.0, 0.4, 0.7, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const _titleStyle = TextStyle(
    fontSize: 42.0,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
    height: 0.9,
  );

  static const _subtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );

  Route _createSlideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
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
    );
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      _createSlideRoute(const RegisterNumber()),
    );
  }

  void _navigateToMainScreen() {
    Navigator.push(
      context,
      _createSlideRoute(const NumberLogin()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/q.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: const Color.fromARGB(255, 92, 173, 240).withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => _titleGradient.createShader(bounds),
                  child: const Column(
                    children: [
                      Text(
                        "FloodPath",
                        style: _titleStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Text(
                  "A Flood Early-Warning System",
                  style: _subtitleStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "within Marikina River",
                  style: _subtitleStyle,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),

                // Dot indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(messages.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 12 : 8,
                      height: _currentIndex == index ? 12 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.white : Colors.white38,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),

                // Swipable messages
                SizedBox(
                  height: 50,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          messages[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Begin',
                  onPressed: _navigateToRegister,
                ),
                const SizedBox(height: 15),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    children: [
                      const TextSpan(
                        text: "Already have an account? ",
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: _navigateToMainScreen,
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Color(0xFFFFDD55),
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFFFDD55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

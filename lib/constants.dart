import 'package:flutter/material.dart';

const Color PRIMARY = Color(0xFF476A9F);
const Color BTN = Color.fromRGBO(50, 78, 120, 1);

// Gradient colors extracted from the image
const Color GRADIENT_TOP = Color(0xFF43608B);
const Color GRADIENT_BOTTOM = Color(0xFF223045);

// Add a gradient for the fading blue effect
const LinearGradient FADING_BLUE_GRADIENT = LinearGradient(
  colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// Add these constants to your colors.dart or constants.dart file
const Color GRADIENT_LIGHT_BLUE = Color(0xFF62B8C7);  // Light blue
const Color GRADIENT_MEDIUM_BLUE = Color(0xFF185C7C);  // Medium blue
const Color GRADIENT_DARK_BLUE = Color(0xFF003165);    // Dark blue
const Color GRADIENT_DARK_GRAY = Color(0xFF151722);    // Dark gray

// Main title gradient (adjusted to match image)
const LinearGradient FLOODPATH_TITLE_GRADIENT = LinearGradient(
  colors: [
    GRADIENT_LIGHT_BLUE,
    GRADIENT_MEDIUM_BLUE,
    GRADIENT_DARK_BLUE,
    GRADIENT_DARK_GRAY,
  ],
  stops: [0.0, 0.4, 0.7, 1.0], // Adjusted stops for smoother transition
  begin: Alignment.topLeft,      // Matches image gradient direction
  end: Alignment.bottomRight,
);

// Text style for the title (matches image proportions)
const TextStyle FLOODPATH_TITLE_STYLE = TextStyle(
  fontSize: 42.0,
  fontWeight: FontWeight.w900,
  letterSpacing: 1.2,
  height: 0.9,
);

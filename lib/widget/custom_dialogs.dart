import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants.dart'; // Assuming you have constants like FB_DARK_PRIMARY defined here












Future<void> customDialog(
  BuildContext context, {
  required String title,
  required String content,
  VoidCallback? onPrivacyPolicyPressed,
  VoidCallback? onTermsOfServicePressed,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // To make the dialog compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content),
            if (onPrivacyPolicyPressed != null || onTermsOfServicePressed != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text.rich(
                  TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    children: [
                      if (onPrivacyPolicyPressed != null)
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: PRIMARY, // Use your primary color
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = onPrivacyPolicyPressed,
                        ),
                      if (onPrivacyPolicyPressed != null && onTermsOfServicePressed != null)
                        TextSpan(text: ' and '),
                      if (onTermsOfServicePressed != null)
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: PRIMARY, // Use your primary color
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = onTermsOfServicePressed,
                        ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Okay'),
            style: ElevatedButton.styleFrom(
              backgroundColor: PRIMARY,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



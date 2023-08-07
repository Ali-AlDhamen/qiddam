import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';


class WelcomeSignupMessage extends StatelessWidget {
  const WelcomeSignupMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          "Create Account!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Fill Your Details Or Continue With Google",
          style: TextStyle(
            fontSize: 16,
            color: AppTheme.subtitleColor,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
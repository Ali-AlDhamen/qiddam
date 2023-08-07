import 'package:flutter/material.dart';
import 'package:qiddam/core/constants/app_sizes.dart';

import 'package:qiddam/theme/app_theme.dart';

class WelcomeSignInMessage extends StatelessWidget {
  const WelcomeSignInMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        gapH64,
        Text(
          "Welcome Back!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        gapH12,
        Text(
          "please sign in to your account",
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.subtitleColor,
          ),
        ),
        gapH64,
      ],
    );
  }
}

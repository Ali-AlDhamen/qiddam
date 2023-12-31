import 'package:flutter/material.dart';
import 'package:qiddam/core/constants/app_sizes.dart';

import '../../../../theme/app_theme.dart';


class WelcomeSignupMessage extends StatelessWidget {
  const WelcomeSignupMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
       gapH64,
        Text(
          "Create Account!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Fill Your Details Or Continue With Google",
          style: TextStyle(
            fontSize: 16,
            color: AppTheme.subtitleColor,
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
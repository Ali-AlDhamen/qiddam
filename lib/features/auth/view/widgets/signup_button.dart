import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:qiddam/theme/app_theme.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  void navigateToSignupPage(BuildContext context) {
    context.go("/signup");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.subtitleColor,
            )),
        TextButton(
          onPressed: () => navigateToSignupPage(context),
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

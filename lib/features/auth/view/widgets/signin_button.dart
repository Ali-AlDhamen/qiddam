import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/theme/app_theme.dart';


class SigninButton extends StatelessWidget {
  const SigninButton({
    super.key,
  });

  void navigateToSigninPage(BuildContext context) {
    context.go("/signin");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Have an Account?",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
            )),
        TextButton(
          onPressed: () => navigateToSigninPage(context),
          child: const Text(
            "Sign In",
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
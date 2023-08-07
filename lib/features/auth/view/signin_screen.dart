import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/constants/app_sizes.dart';
import 'package:qiddam/core/utils/email_vaildator.dart';
import 'package:qiddam/features/auth/view/widgets/auth_button.dart';
import 'package:qiddam/features/auth/view/widgets/custom_textfield.dart';
import 'package:qiddam/features/auth/view/widgets/password_field.dart';
import 'package:qiddam/features/auth/view/widgets/signup_button.dart';

import '../controller/auth_controller.dart';
import 'widgets/welcome_signin_message.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signInWithEmail(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).signInWithEmail(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          context: context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const WelcomeSignInMessage(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: emailVaildator,
                        hintText: "Email",
                      ),
                      PasswordField(
                        controller: _passwordController,
                      ),
                    ],
                  ),
                ),
                AuthButton(
                    onPressed: signInWithEmail, text: "Sign In"),
                const SignupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

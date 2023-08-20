import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/features/auth/view/widgets/auth_button.dart';
import 'package:qiddam/features/auth/view/widgets/custom_textfield.dart';
import 'package:qiddam/features/auth/view/widgets/password_field.dart';
import 'package:qiddam/features/auth/view/widgets/signin_button.dart';
import 'package:qiddam/features/auth/view/widgets/welcome_signup_message.dart';

import '../../../core/utils/email_vaildator.dart';
import '../../../core/utils/name_vaildator.dart';
import '../../../core/utils/username_vaildator.dart';
import '../controller/auth_controller.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signUpWithEmail(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).signUpWithEmail(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            username: _usernameController.text.trim(),
            name: _nameController.text.trim(),
            context: context,
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _nameController.dispose();
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
                const WelcomeSignupMessage(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        validator: nameVaildator,
                        hintText: "name",
                      ),
                      CustomTextField(
                        extra: ".qiddam.com",
                        keyboardType: TextInputType.name,
                        controller: _usernameController,
                        validator: usernameVaildator,
                        hintText: "Username",
                      ),
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
                  onPressed: signUpWithEmail,
                  text: "Sign Up",
                ),
                const SigninButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

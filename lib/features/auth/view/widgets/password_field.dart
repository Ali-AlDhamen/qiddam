import 'package:flutter/material.dart';

import 'package:qiddam/theme/app_theme.dart';

import '../../../../core/utils/password_vaildator.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = false;

  void togglePasswordIcon() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        cursorColor: AppTheme.primaryColor,

        keyboardType: TextInputType.visiblePassword,
        scrollPadding: const EdgeInsets.only(bottom: 100),
        obscureText: !_passwordVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: AppTheme.subtitleColor,
            fontSize: 14,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppTheme.primaryColor,
            ),
            onPressed: togglePasswordIcon,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          hintText: "Password",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppTheme.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppTheme.subtitleColor,
            ),
          ),
        ),
        validator: passwordVaildator,
      ),
    );
  }
}

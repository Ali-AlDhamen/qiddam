import 'package:flutter/material.dart';
import 'package:qiddam/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.keyboardType,
    this.extra,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final String? extra;
  final TextInputType keyboardType;

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
        scrollPadding: const EdgeInsets.only(bottom: 100),
        controller: controller,
        keyboardType: keyboardType,
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
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

          hintStyle: const TextStyle(
            color: AppTheme.subtitleColor,
            fontSize: 16,
          ),
          suffixText: extra, // Set the suffix text
          suffixStyle: const TextStyle(
            color: AppTheme.subtitleColor,
            fontSize: 16,
          ),
        ),
        validator: validator,
      ),
    );
  }
}

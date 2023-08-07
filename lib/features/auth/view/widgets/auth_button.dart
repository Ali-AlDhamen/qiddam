import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/common/loader_widget.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../controller/auth_controller.dart';

class AuthButton extends ConsumerWidget {
  final void Function(BuildContext) onPressed;
  final String text;
  const AuthButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isLoading = ref.watch(authControllerProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),

      height: 60,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: false ? null : () => onPressed(context),
        child: false
            ? const LoaderWidget()
            :  Text(
               text,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
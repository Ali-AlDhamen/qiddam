import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/common/loader_widget.dart';
import 'package:qiddam/core/constants/app_sizes.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../../auth/controller/auth_controller.dart';

class UpdateButton extends ConsumerWidget {
  final void Function(BuildContext, WidgetRef) onPressed;

  final String text;
  const UpdateButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
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
        onPressed: isLoading ? null : () => onPressed(context, ref),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapW8,
            if (isLoading) const LoaderWidget(color: AppTheme.whiteColor),
          ],
        ),
      ),
    );
  }
}

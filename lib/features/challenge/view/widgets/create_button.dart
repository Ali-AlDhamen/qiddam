import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/common/loader_widget.dart';
import 'package:qiddam/core/constants/app_sizes.dart';
import 'package:qiddam/features/challenge/controller/challenge_controller.dart';
import 'package:qiddam/theme/app_theme.dart';

class CreateButton extends ConsumerWidget {
  final void Function(BuildContext, WidgetRef) onPressed;

  final String text;
  const CreateButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(challengeControllerProvider);
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
        onPressed: state.isLoading ? null : () => onPressed(context, ref),
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
            if (state.isLoading) const LoaderWidget(color: AppTheme.whiteColor),
          ],
        ),
      ),
    );
  }
}

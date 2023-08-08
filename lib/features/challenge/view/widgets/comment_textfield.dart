import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/loader_widget.dart';
import '../../../../theme/app_theme.dart';
import '../../controller/challenge_controller.dart';

class CommentTextField extends ConsumerWidget {
  final TextEditingController commentController = TextEditingController();
  final String challengeId;

  CommentTextField({super.key, required this.challengeId});

  void writeComment(BuildContext context, WidgetRef ref) {
    ref.read(challengeControllerProvider.notifier).addComment(
          challengeId: challengeId,
          comment: commentController.text.trim(),
          context: context,
        );

    commentController.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(challengeControllerProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorColor: AppTheme.primaryColor,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryColor,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppTheme.subtitleColor,
                  ),
                ),
                hintText: 'Write a comment',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.subtitleColor,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: isLoading ? null : () => writeComment(context, ref),
            icon: isLoading
                ? const LoaderWidget()
                : const Icon(Icons.send, color: AppTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}

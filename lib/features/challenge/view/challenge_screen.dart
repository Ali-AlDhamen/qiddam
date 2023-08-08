import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/features/challenge/controller/challenge_controller.dart';
import 'package:qiddam/features/challenge/view/widgets/challenge_comments.dart';
import 'package:qiddam/features/challenge/view/widgets/comment_textfield.dart';

import 'widgets/challenge_details_Widget.dart';

class ChallengeScreen extends ConsumerWidget {
  final TextEditingController commentController = TextEditingController();
  final String challengeId;
  ChallengeScreen({Key? key, required this.challengeId}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Challenge'),
      ),
      body: Column(
        children: [
          ChallengeDetailsWidget(
            challengeId: challengeId,
          ),
          CommentTextField(
            challengeId: challengeId,
          ),
          ChallengeComments(
            challengeId: challengeId,
          )
        ],
      ),
    );
  }
}

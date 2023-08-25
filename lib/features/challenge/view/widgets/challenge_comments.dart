import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/features/challenge/view/widgets/comment_widget.dart';

import '../../../../core/common/aysnc_value_widget.dart';
import '../../controller/challenge_controller.dart';

class ChallengeComments extends ConsumerWidget {
  final String challengeId;
  const ChallengeComments({
    super.key,
    required this.challengeId,
  });

  void navigateToProfileScreen(BuildContext context, String userID) {
    context.go('/home/profile/$userID');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(watchCommentsProvider(challengeId));

    return AsyncValueWidget(
      value: comments,
      data: (comments) {
        if (comments.isEmpty) {
          return const Center(
            child: Text('No Comments'),
          );
        }
        return Column(
          children: comments.map((e) => CommentWidget(comment: e)).toList(),
        );
      },
    );
  }
}

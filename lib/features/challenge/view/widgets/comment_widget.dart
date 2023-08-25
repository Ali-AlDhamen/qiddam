import 'package:flutter/material.dart';
import 'package:qiddam/features/challenge/view/widgets/comment_user_details.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../models/comment.dart';
import 'comment_content.dart';
import 'comment_date_and_reply.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          CommentUserDetails(comment.userId),
          gapH8,
          CommentContent(comment: comment),
          gapH8,
          CommentDateAndReply(comment: comment),
        ],
      ),
    );
  }
}

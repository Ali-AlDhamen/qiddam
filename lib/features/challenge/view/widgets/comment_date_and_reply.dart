import 'package:flutter/material.dart';
import 'package:qiddam/core/utils/time_ago_since_date.dart';
import 'package:qiddam/models/comment.dart';
import 'package:qiddam/theme/app_theme.dart';

class CommentDateAndReply extends StatelessWidget {
  const CommentDateAndReply({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(
              Icons.reply,
              color: AppTheme.primaryColor,
            ),
            Text(
              'Reply',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.subtitleColor,
              ),
            ),
          ],
        ),
        Text(
          timeAgoSinceDate(comment.createdAt.toString()),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.subtitleColor,
          ),
        ),
      ],
    );
  }
}

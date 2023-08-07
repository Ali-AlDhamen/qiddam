import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'comment.freezed.dart';

part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String content,
    required String postId,
    required String userId,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

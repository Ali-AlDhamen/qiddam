import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'challenge.freezed.dart';

part 'challenge.g.dart';

@freezed
class Challenge with _$Challenge {
  const factory Challenge({
    required List<String> participants,
    required String id,
    required String title,
    required String description,
    required String userId,
    required DateTime createdAt,
    required int days
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
}


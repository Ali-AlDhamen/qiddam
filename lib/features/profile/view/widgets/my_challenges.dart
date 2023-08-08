import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/aysnc_value_widget.dart';
import '../../../../models/challenge.dart';
import '../../../challenge/controller/challenge_controller.dart';
import 'my_challenge_card.dart';

class MyChallenges extends ConsumerWidget {
  final String userId;
  const MyChallenges({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userChallenges = ref.watch(watchUserChallengesProvider(userId));

    return AsyncValueWidget<List<Challenge>>(
      value: userChallenges,
      data: (challenges) {
        if (challenges.isEmpty) {
          return const Center(child: Text('No Challenges'));
        }
        return Expanded(
          child: ListView.builder(
            itemCount: challenges.length,
            itemBuilder: (context, index) {
              final challenge = challenges[index];
              return MyChallengeCard(challenge: challenge);
            },
          ),
        );
      },
    );
  }
}

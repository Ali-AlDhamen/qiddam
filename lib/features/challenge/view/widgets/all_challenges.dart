import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/aysnc_value_widget.dart';
import '../../../../models/challenge.dart';
import '../../controller/challenge_controller.dart';
import 'callenge_card.dart';

class AllChallenges extends ConsumerWidget {
  const AllChallenges({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenges = ref.watch(watchChallengesProvider);

    return AsyncValueWidget<List<Challenge>>(
      value: challenges,
      data: (challenges) {
        if (challenges.isEmpty) {
          return const Center(child: Text('No Challenges'));
        }
        return ListView.builder(
          itemCount: challenges.length,
          itemBuilder: (context, index) {
            final challenge = challenges[index];
            return ChallengeCard(challenge: challenge);
          },
        );
      },
    );
  }
}

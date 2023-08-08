import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/aysnc_value_widget.dart';
import '../../../../models/challenge.dart';
import '../../controller/challenge_controller.dart';
import 'challenge_details_card.dart';

class ChallengeDetailsWidget extends ConsumerWidget {
  final String challengeId;
  const ChallengeDetailsWidget({super.key, required this.challengeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenge = ref.watch(watchChallengeProvider(challengeId));

    return AsyncValueWidget<Challenge>(
      value: challenge,
      data: (challenge) {
        return ChallengeDetailsCard(challenge: challenge);
      },
    );
  }
}

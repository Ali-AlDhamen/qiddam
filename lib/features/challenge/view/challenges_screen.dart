import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/features/challenge/controller/challenge_controller.dart';
import 'package:qiddam/features/challenge/view/widgets/callenge_card.dart';

import '../../../core/common/aysnc_value_widget.dart';
import '../../../models/challenge.dart';
import '../../auth/controller/auth_controller.dart';

class ChallengesScreen extends ConsumerWidget {
  const ChallengesScreen({super.key});

  void navigateToCreateChallengeScreen(BuildContext context) {
    context.push('/create-challenge');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenges = ref.watch(watchChallengesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: AsyncValueWidget<List<Challenge>>(
        value: challenges,
        data: (challenges){
          if (challenges.isEmpty) return const Center(child: Text('No Challenges'));
          return ListView.builder(
            itemCount: challenges.length,
            itemBuilder: (context, index) {
              final challenge = challenges[index];
              return ChallengeCard(challenge: challenge);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => navigateToCreateChallengeScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

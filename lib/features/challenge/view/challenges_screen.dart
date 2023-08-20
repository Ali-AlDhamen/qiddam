import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'widgets/all_challenges.dart';

class ChallengesScreen extends ConsumerWidget {
  const ChallengesScreen({super.key});

  void navigateToCreateChallengeScreen(BuildContext context) {
    context.push('/home/create-challenge');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: const AllChallenges(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => navigateToCreateChallengeScreen(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}


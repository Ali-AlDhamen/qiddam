import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengesScreen extends ConsumerWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: const Center(
        child: Text('Challenges'),
      ),
    );
  }
}

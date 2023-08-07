import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controller/auth_controller.dart';

class ChallengesScreen extends ConsumerWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: Center(
        // logout button
        child: ElevatedButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
            },
            child: Text('Logout')),
      ),
    );
  }
}

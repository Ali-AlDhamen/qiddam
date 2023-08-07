import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/features/profile/view/widgets/challenge_card.dart';
import 'package:qiddam/features/profile/view/widgets/profile_information.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../../models/challenge.dart';
import '../../auth/controller/auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            icon: const Icon(Icons.logout, color: AppTheme.primaryColor),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const ProfileInformation(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'My Challenges',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.subtitleColor),
                  ),
                ),
              ),
              ChallengeCard(
                challenge: Challenge(
                  title: 'Challenge 1',
                  participants: const ["Ali", "Ahmed", "Hassan"],
                  id: '1',
                  description: 'description',
                  userId: 'userId',
                  createdAt: DateTime.now(),
                  days: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

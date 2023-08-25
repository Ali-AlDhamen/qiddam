// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:qiddam/features/profile/view/widgets/my_challenges.dart';
import 'package:qiddam/features/profile/view/widgets/profile_information.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../auth/controller/auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  final String? id;
  const ProfileScreen({
    super.key,
    this.id,
  });

  void logout(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signOut();
  }

  String getProfileUserId(BuildContext context, WidgetRef ref) {
    if (GoRouterState.of(context).uri.toString() == "/profile") {
      return ref.read(userProvider)?.id ?? "";
    }

    return id ?? "";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = getProfileUserId(context, ref);
    final currentUserId = ref.read(userProvider)?.id ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          currentUserId == userId
              ? IconButton(
                  onPressed: () => logout(ref),
                  icon: const Icon(Icons.logout, color: AppTheme.primaryColor),
                )
              : const SizedBox(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ProfileInformation(userId: userId, currentUserId: currentUserId),
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
                MyChallenges(userId: userId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

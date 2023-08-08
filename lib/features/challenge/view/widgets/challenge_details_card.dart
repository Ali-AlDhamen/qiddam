import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/features/challenge/view/widgets/user_details_widget.dart';
import 'package:qiddam/models/challenge.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/time_ago_since_date.dart';
import '../../../../models/user_model.dart';
import '../../../../theme/app_theme.dart';
import '../../../auth/controller/auth_controller.dart';
import '../../controller/challenge_controller.dart';

class ChallengeDetailsCard extends ConsumerWidget {
  final Challenge challenge;
  const ChallengeDetailsCard({super.key, required this.challenge});

  void joinChallenge({
    required BuildContext context,
    required WidgetRef ref,
    required bool isUserJoined,
  }) {
    if (isUserJoined) {
      return;
    }
    ref.read(challengeControllerProvider.notifier).joinChallenge(
          challengeId: challenge.id,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user =
        ref.watch(getUserDataProvider(challenge.userId)).asData?.value ??
            const UserModel(
              email: "guest@guest.com",
              id: "11",
              name: "guest",
              photoUrl:
                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
              username: "guest",
            );
    final isUserJoined =
        challenge.participants.contains(ref.read(userProvider)?.id);
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                challenge.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.share,
                size: 25,
                color: AppTheme.subtitleColor,
              ),
            ],
          ),
          UserDetailsWidget(
            user: user,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: AppTheme.subtitleColor,
                  ),
                  gapW4,
                  Text(
                    challenge.participants.length.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.subtitleColor,
                    ),
                  ),
                ],
              ),
              gapW12,
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: AppTheme.subtitleColor,
                  ),
                  gapW4,
                  Text(
                    timeAgoSinceDate(challenge.createdAt.toString()),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.subtitleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => joinChallenge(
                context: context,
                ref: ref,
                isUserJoined: isUserJoined,
              ),
              child: isUserJoined
                  ? const Text("You are In")
                  : const Text('Qiddam!'),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              challenge.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.subtitleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

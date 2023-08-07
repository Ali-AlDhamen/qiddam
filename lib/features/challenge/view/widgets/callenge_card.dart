import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/features/auth/controller/auth_controller.dart';
import 'package:qiddam/models/challenge.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../models/user_model.dart';
import '../../../../theme/app_theme.dart';

class ChallengeCard extends ConsumerWidget {
  final Challenge challenge;
  const ChallengeCard({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref
            .watch(getUserDataProvider(challenge.userId))
            .asData
            ?.value ??
        const UserModel(
            email: "guest@guest.com",
            id: "11",
            name: "guest",
            photoUrl:
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
            username: "guest");
    
    return InkWell(
      onTap: () {
        context.go('/challenge/${challenge.id}');
      },
      child: Container(
        height: 150,
        width: double.infinity,
        // shadow
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
                    color: AppTheme.cardTitleColor,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: AppTheme.cardTitleColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(user.photoUrl!),
                    ),
                    gapW4,
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.subtitleColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline_outlined,
                      size: 25,
                      color: AppTheme.subtitleColor,
                    ),
                    gapW4,
                    Text(
                      '${challenge.participants.length} Participant',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.subtitleColor,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

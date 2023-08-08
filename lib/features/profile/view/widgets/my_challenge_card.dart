import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/models/challenge.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../theme/app_theme.dart';

class MyChallengeCard extends StatelessWidget {
  final Challenge challenge;
  const MyChallengeCard({
    super.key,
    required this.challenge,
  });

  void navigateToChallengeDetails(BuildContext context) {
    context.go('/profile/challenge/${challenge.id}');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToChallengeDetails(context),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
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
              children: [
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

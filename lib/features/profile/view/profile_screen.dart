import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/constants/app_sizes.dart';
import 'package:qiddam/features/profile/view/widgets/challenge_card.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../../models/challenge.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                // circular avatar
                // name
                // two buttons edit profile & share

                // list of challenges

                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                  ),
                ),
                gapH12,
                Text(
                  'Ali',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                gapH12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit Profile'),
                    ),
                    gapW12,
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text('Share'),
                          gapW4,
                          Icon(Icons.share),
                        ],
                      ),
                    ),
                  ],
                ),

                gapH12,
                // divider
                Divider(
                  thickness: 1,
                  color: Theme.of(context).primaryColor,
                ),

                gapH12,

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
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/aysnc_value_widget.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/time_ago_since_date.dart';
import '../../../../models/user_model.dart';
import '../../../../theme/app_theme.dart';
import '../../../auth/controller/auth_controller.dart';
import '../../controller/challenge_controller.dart';

class ChallengeComments extends ConsumerWidget {
  final String challengeId;
  const ChallengeComments({
    super.key,
    required this.challengeId,
  });

  void navigateToProfileScreen(BuildContext context, String userID) {
    context.go('/home/profile/$userID');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(watchCommentsProvider(challengeId));

    return AsyncValueWidget(
      value: comments,
      data: (comments) {
        if (comments.isEmpty) {
          return const Center(
            child: Text('No Comments'),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              final user = ref
                      .watch(getUserDataProvider(comment.userId))
                      .asData
                      ?.value ??
                  const UserModel(
                    email: "guest@guest.com",
                    id: "11",
                    name: "guest",
                    photoUrl:
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                    username: "guest",
                  );

              return Container(
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => navigateToProfileScreen(context, user.id),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              user.photoUrl!,
                            ),
                          ),
                          gapW8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.cardTitleColor,
                                ),
                              ),
                              gapH4,
                              Text(
                                "@${user.username!}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.subtitleColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    gapH8,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        comment.content,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    gapH8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.reply,
                              color: AppTheme.primaryColor,
                            ),
                            Text(
                              'Reply',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.subtitleColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          timeAgoSinceDate(comment.createdAt.toString()),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

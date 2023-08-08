import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/core/common/aysnc_value_widget.dart';
import 'package:qiddam/core/common/loader_widget.dart';
import 'package:qiddam/core/constants/app_sizes.dart';
import 'package:qiddam/core/utils/time_ago_since_date.dart';
import 'package:qiddam/features/challenge/controller/challenge_controller.dart';
import 'package:qiddam/models/challenge.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../../models/user_model.dart';
import '../../auth/controller/auth_controller.dart';

class ChallengeScreen extends ConsumerWidget {
  final TextEditingController commentController = TextEditingController();
  final String challengeId;
  ChallengeScreen({Key? key, required this.challengeId}) : super(key: key);

  void writeComment(BuildContext context, WidgetRef ref) {
    ref.read(challengeControllerProvider.notifier).addComment(
          challengeId: challengeId,
          comment: commentController.text.trim(),
          context: context,
        );

    commentController.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(challengeControllerProvider);
    final challenge = ref.watch(watchChallengeProvider(challengeId));
    final comments = ref.watch(watchCommentsProvider(challengeId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Challenge'),
      ),
      body: Column(
        children: [
          AsyncValueWidget<Challenge>(
              value: challenge,
              data: (challenge) {
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
                        offset:
                            const Offset(0, 2), // changes position of shadow
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
                      InkWell(
                        onTap: () {
                          context.go('/profile/${user.id}');
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                user.photoUrl!,
                              ),
                            ),
                            gapW12,
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.subtitleColor,
                              ),
                            ),
                          ],
                        ),
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
                                timeAgoSinceDate(
                                    challenge.createdAt.toString()),
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
                          onPressed: () {
                            if (challenge.participants
                                .contains(ref.read(userProvider)?.id)) {
                              return;
                            } else {
                              ref
                                  .read(challengeControllerProvider.notifier)
                                  .joinChallenge(
                                    challengeId: challenge.id,
                                    context: context,
                                  );
                            }
                          },
                          child: challenge.participants
                                  .contains(ref.read(userProvider)?.id)
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
              }),
          Container(
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
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: AppTheme.primaryColor,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppTheme.subtitleColor,
                        ),
                      ),
                      hintText: 'Write a comment',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.subtitleColor,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed:
                      isLoading ? null : () => writeComment(context, ref),
                  icon: isLoading
                      ? const LoaderWidget()
                      : const Icon(Icons.send, color: AppTheme.primaryColor),
                ),
              ],
            ),
          ),
          AsyncValueWidget(
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
                              username: "guest");

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
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context.go('/profile/${user.id}');
                              },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  timeAgoSinceDate(
                                      comment.createdAt.toString()),
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
              })
        ],
      ),
    );
  }
}

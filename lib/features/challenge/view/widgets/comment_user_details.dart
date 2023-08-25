import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../models/user_model.dart';
import '../../../../theme/app_theme.dart';
import '../../../auth/controller/auth_controller.dart';

class CommentUserDetails extends ConsumerWidget {
  final String userID;
  const CommentUserDetails(this.userID, {super.key});

  void navigateToProfileScreen(BuildContext context, String userID) {
    context.go('/home/profile/$userID');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getUserDataProvider(userID)).asData?.value ??
        const UserModel(
          email: "guest@guest.com",
          id: "11",
          name: "guest",
          photoUrl:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
          username: "guest",
        );
    return InkWell(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/models/user_model.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../theme/app_theme.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserModel user;
  const UserDetailsWidget({super.key, required this.user});

  void navigateToProfileScreen(BuildContext context) {
    context.push('/home/profile/${user.id}');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToProfileScreen(context),
      child: Row(
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
    );
  }
}

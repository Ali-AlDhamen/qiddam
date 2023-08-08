import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../models/user_model.dart';
import '../../../auth/controller/auth_controller.dart';

class ProfileInformation extends ConsumerWidget {
  final String userId;
  final String currentUserId;
  const ProfileInformation(
      {super.key, required this.userId, required this.currentUserId});

  void copyUserLink(String name, BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: "$name.qiddam.com"));

    // ignore: use_build_context_synchronously
    showSnackbar(context, "User Link Copied to Clipboard");
  }

  void launchUserProfile(String username) async {
    final Uri url = Uri.parse("https://$username.qiddam.com/");
    await launchUrl(url);
  }

  void navigateToEditProfile(BuildContext context) {
    context.push('/profile/update');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getUserDataProvider(userId)).asData?.value ??
        const UserModel(
            email: "guest@guest.com",
            id: "11",
            name: "guest",
            photoUrl:
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
            username: "guest");
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            user.photoUrl!,
          ),
        ),
        gapH12,
        Text(
          user.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        gapH8,
        TextButton(
          onPressed: () => launchUserProfile(user.name),
          child: Text(
            "${user.username}.qiddam.com",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
            ),
          ),
        ),
        gapH12,
        currentUserId == userId
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => navigateToEditProfile(context),
                    child: const Text('Edit Profile'),
                  ),
                  gapW12,
                  ElevatedButton(
                    onPressed: () => copyUserLink(user.name, context),
                    child: const Row(
                      children: [
                        Text('Share'),
                        gapW4,
                        Icon(Icons.share),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),

        gapH12,
        // divider
        Divider(
          thickness: 1,
          color: Theme.of(context).primaryColor,
        ),
        gapH12,
      ],
    );
  }
}

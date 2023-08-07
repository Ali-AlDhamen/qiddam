import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../auth/controller/auth_controller.dart';

class ProfileInformation extends ConsumerWidget {
  const ProfileInformation({super.key});

  void copyUserLink(String name, BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: "$name.qiddam.com"));

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'User link copied to clipboard',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
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
    final user = ref.watch(userProvider)!;
    print(user);
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
        Row(
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
        ),

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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/common/loader_widget.dart';
import 'package:qiddam/core/utils/name_vaildator.dart';
import 'package:qiddam/features/profile/view/widgets/update_button.dart';
import 'package:qiddam/theme/app_theme.dart';

import '../../../core/utils/pick_image.dart';
import '../../../models/user_model.dart';
import '../../auth/controller/auth_controller.dart';
import '../../auth/view/widgets/custom_textfield.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateProfileScreen> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final _name = TextEditingController();
  UserModel? userData;
  File? image;

  @override
  void initState() {
    userData = ref.read(userProvider);
    _name.text = userData!.name;
    super.initState();
  }

  void pickUserImage() async {
    final res = await pickImage();
    if (res == null) {
      return;
    }
    setState(() {
      image = File(res.files.first.path!);
    });
  }

  void updateProfile(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).updateUserData(
          newName: _name.text.trim(),
          newImage: image,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: AppTheme.subtitleColor,
                          child: Image(
                            image: image != null
                                ? FileImage(image!) as ImageProvider
                                : NetworkImage(userData!.photoUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppTheme.primaryColor),
                        child: IconButton(
                          onPressed: isLoading ? null : () => pickUserImage(),
                          icon: const Icon(Icons.camera_alt_rounded, size: 20),
                          color: AppTheme.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // -- Form Fields
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "name",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: _name,
                        validator: nameVaildator,
                        hintText: "name",
                        keyboardType: TextInputType.name,
                      ),
                      UpdateButton(
                        onPressed: updateProfile,
                        text: "Update Profile",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

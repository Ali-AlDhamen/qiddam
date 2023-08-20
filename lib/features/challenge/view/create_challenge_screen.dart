import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/core/constants/app_sizes.dart';
import 'package:qiddam/core/utils/general_vaildator.dart';
import 'package:qiddam/core/utils/number_vaildator.dart';
import 'package:qiddam/features/auth/view/widgets/custom_textfield.dart';
import 'package:qiddam/features/challenge/view/widgets/create_button.dart';

import '../controller/challenge_controller.dart';

class CreateChallengeScreen extends ConsumerStatefulWidget {
  const CreateChallengeScreen({super.key});

  @override
  ConsumerState<CreateChallengeScreen> createState() =>
      _CreateChallengeScreenState();
}

class _CreateChallengeScreenState extends ConsumerState<CreateChallengeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void createChallenge(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      ref.read(challengeControllerProvider.notifier).createChallenge(
            context: context,
            title: _titleController.text,
            description: _descriptionController.text,
            days: int.parse(_daysController.text),
          );
    }
  }

  void setUpPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    final token = await fcm.getToken();
    fcm.subscribeToTopic('challenges');
    print(token);
  }

  @override
  void initState() {
    super.initState();
    setUpPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Challenge'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                gapH64,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        keyboardType: TextInputType.text,
                        controller: _titleController,
                        hintText: 'Title',
                        validator: generalVaildator,
                      ),
                      CustomTextField(
                          keyboardType: TextInputType.multiline,
                          controller: _descriptionController,
                          hintText: 'Description',
                          validator: generalVaildator),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: _daysController,
                        hintText: 'Days',
                        validator: numberVaildator,
                      ),
                    ],
                  ),
                ),
                CreateButton(
                  onPressed: createChallenge,
                  text: 'Create Challenge',
                ),
              ],
            ),
          ),
        ));
  }
}

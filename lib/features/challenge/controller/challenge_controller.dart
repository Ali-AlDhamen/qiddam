import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/core/utils/show_snackbar.dart';
import 'package:uuid/uuid.dart';

import '../../../core/providers/storage_provider.dart';
import '../../../models/challenge.dart';
import '../../../models/comment.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/challenge_repository.dart';

final challengeControllerProvider =
    StateNotifierProvider<ChallengeController, bool>((ref) {
  return ChallengeController(
      challengeRepository: ref.watch(challengeRepositoryProvider),
      ref: ref,
      storageRepository: ref.watch(storageRepositoryProvider));
});

final watchChallengesProvider = StreamProvider<List<Challenge>>((ref) {
  final challengeController = ref.watch(challengeControllerProvider.notifier);
  return challengeController.watchChallenges();
});

final watchUserChallengesProvider =
    StreamProvider.family<List<Challenge>, String>((ref, String userID) {
  final challengeController = ref.watch(challengeControllerProvider.notifier);
  return challengeController.watchUserChallenges(userID);
});

final watchCommentsProvider =
    StreamProvider.family<List<Comment>, String>((ref, String postID) {
  final challengeController = ref.watch(challengeControllerProvider.notifier);
  return challengeController.watchComments(postID);
});

final watchChallengeProvider =
    StreamProvider.family<Challenge, String>((ref, String challengeID) {
  final challengeController = ref.watch(challengeControllerProvider.notifier);
  return challengeController.watchChallenge(challengeID);
});

class ChallengeController extends StateNotifier<bool> {
  final ChallengeRepository _challengeRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  ChallengeController(
      {required ChallengeRepository challengeRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _challengeRepository = challengeRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void createChallenge({
    required String title,
    required String description,
    required int days,
    required BuildContext context,
  }) async {
    state = true;

    final userId = _ref.read(userProvider)?.id ?? '';
    final id = const Uuid().v4();
    final Challenge challenge = Challenge(
      participants: [userId],
      id: id,
      title: title,
      description: description,
      userId: userId,
      createdAt: DateTime.now(),
      days: days,
    );

    final res = await _challengeRepository.createChallenge(
      challenge: challenge,
    );
    state = false;
    res.fold((l) {
      showSnackbar(context, l.message);
    }, (r) async {
      showSnackbar(context, 'Challenge created successfully');
      context.pop();
    });
  }

  void addComment({
    required String comment,
    required String challengeId,
    required BuildContext context,
  }) async {
    state = true;

    final userId = _ref.read(userProvider)?.id ?? '';
    final id = const Uuid().v4();
    final Comment commentModel = Comment(
      id: id,
      postId: challengeId,
      content: comment,
      userId: userId,
      createdAt: DateTime.now(),
    );

    final res = await _challengeRepository.addComment(
      comment: commentModel,
    );
    state = false;

    res.fold((l) {
      showSnackbar(context, l.message);
    }, (r) async {
      showSnackbar(context, 'Comment added successfully');
    });
  }

  void joinChallenge({
    required String challengeId,
    required BuildContext context,
  }) async {
    state = true;

    final userId = _ref.read(userProvider)?.id ?? '';

    final res = await _challengeRepository.joinChallenge(
      challengeID: challengeId,
      userID: userId,
    );
    state = false;

    res.fold((l) {
      showSnackbar(context, l.message);
    }, (r) async {
      showSnackbar(context, 'Challenge joined successfully');
    });
  }

  Stream<List<Challenge>> watchChallenges() {
    return _challengeRepository.watchChallenges();
  }

  Stream<List<Challenge>> watchUserChallenges(String userID) {
    return _challengeRepository.watchUserChallenges(userID);
  }

  Stream<List<Comment>> watchComments(String postID) {
    return _challengeRepository.watchComments(postID);
  }

  Stream<Challenge> watchChallenge(String challengeID) {
    return _challengeRepository.watchChallenge(challengeID);
  }
}

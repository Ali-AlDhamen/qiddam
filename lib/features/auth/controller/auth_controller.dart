import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/storage_provider.dart';
import '../../../models/user_model.dart';
import '../repository/auth_repository.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    storageRepository: ref.watch(storageRepositoryProvider),
    ref: ref,
  ),
);

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;
  final StorageRepository _storageRepository;
  final Ref _ref;
  AuthController(
      {required AuthRepository authRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _authRepository = authRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(const AsyncData(null));

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  String initalPath() {
    return _authRepository.initalPath();
  }

  void signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String name,
    required BuildContext context,
  }) async {
    state = const AsyncLoading();
    final user = await _authRepository.signUpWithEmail(
        email: email, password: password, username: username, name: name);
    user.fold((l) {
      state = AsyncError(l.message, StackTrace.empty);
    }, (userModel) {
      _ref.read(userProvider.notifier).update((state) => userModel);
    });

    state = const AsyncData(null);
  }

  void signInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = const AsyncLoading();
    final user =
        await _authRepository.signInWithEmail(email: email, password: password);

    user.fold(
      (l) {
        state = AsyncError(l.message, StackTrace.empty);
      },
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
    state = const AsyncData(null);
  }

  void updateUserData({
    required String newName,
    required File? newImage,
    required BuildContext context,
  }) async {
    state = const AsyncLoading();

    final userModel = _ref.read(userProvider)!;

    String imageUrl = userModel.photoUrl!;

    if (newImage != null) {
      final imageUpload = await _storageRepository.storeFile(
        path: 'users',
        id: userModel.id,
        file: newImage,
      );

      imageUrl = imageUpload.fold(
        (l) => userModel.photoUrl!,
        (r) => r,
      );
    }

    final newUserModel = UserModel(
      id: userModel.id,
      name: newName,
      email: userModel.email,
      photoUrl: imageUrl,
      username: userModel.username,
    );
    final res = await _authRepository.updateUserData(newUserModel);

    res.fold(
      (l) {
        state = AsyncError(l.message, StackTrace.empty);
      },
      (r) {
        _ref.read(userProvider.notifier).update((state) => newUserModel);
        context.pop();
      },
    );
    state = const AsyncData(null);
  }

  void signOut() {
    _authRepository.signOut();
    _ref.read(userProvider.notifier).update((state) => null);
  }
}

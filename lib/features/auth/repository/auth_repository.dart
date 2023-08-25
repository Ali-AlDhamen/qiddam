import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/exceptions/fireauth_exceptions.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/types/failure.dart';
import '../../../core/types/future_either.dart';
import '../../../models/user_model.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    firestore: ref.watch(firestoreProvider),
    auth: ref.watch(authProvider),
  );
}

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRepository(
      {required FirebaseFirestore firestore, required FirebaseAuth auth})
      : _firestore = firestore,
        _auth = auth;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  String initalPath() {
    if (_auth.currentUser != null) {
      return '/home';
    } else {
      return '/signin';
    }
  }

  FutureEither<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String name,
  }) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final userId = authResult.user!.uid;

      UserModel userModel = UserModel(
          id: userId,
          email: email,
          username: username,
          name: name,
          photoUrl:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png");
      await _users.doc(userId).set(userModel.toJson());

      return Right(userModel);
    } on FirebaseException catch (e) {
      return Left(Failure(handleAuthException(e.code)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> signInWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final userId = authResult.user!.uid;

      UserModel userModel = await getUserData(userId).first;

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(handleAuthException(e.code)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map((event) {
      return UserModel.fromJson(event.data() as Map<String, dynamic>);
    });
  }

  FutureVoid updateUserData(UserModel userModel) async {
    try {
      return Right(await _users.doc(userModel.id).update(userModel.toJson()));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(handleAuthException(e.code)));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/types/failure.dart';
import '../../../core/types/future_either.dart';
import '../../../models/challenge.dart';
import '../../../models/comment.dart';

final challengeRepositoryProvider = Provider<ChallengeRepository>((ref) {
  return ChallengeRepository(
    firestore: ref.watch(firestoreProvider),
  );
});

class ChallengeRepository {
  final FirebaseFirestore _firestore;
  ChallengeRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _challenges =>
      _firestore.collection(FirebaseConstants.challengesCollection);
  CollectionReference get _comments =>
      _firestore.collection(FirebaseConstants.commentsCollection);

  FutureVoid createChallenge({required Challenge challenge}) async {
    try {
      return right(await _challenges.doc(challenge.id).set(challenge.toJson()));
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid addComment({required Comment comment}) async {
    try {
      return right(await _comments.doc(comment.id).set(comment.toJson()));
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Challenge>> watchChallenges() {
    return _challenges.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Challenge.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<List<Challenge>> watchUserChallenges(String userID) {
    return _challenges
        .where('userId', isEqualTo: userID)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Challenge.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<List<Comment>> watchComments(String postID) {
    return _comments
        .where('postId', isEqualTo: postID)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Comment.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<Challenge> watchChallenge(String challengeID) {
    return _challenges.doc(challengeID).snapshots().map((snapshot) {
      return Challenge.fromJson(snapshot.data() as Map<String, dynamic>);
    });
  }

  FutureVoid joinChallenge(
      {required String challengeID, required String userID}) async {
    try {
      return right(await _challenges.doc(challengeID).update({
        'participants': FieldValue.arrayUnion([userID])
      }));
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

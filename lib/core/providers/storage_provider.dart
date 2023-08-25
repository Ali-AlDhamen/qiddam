import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../types/failure.dart';
import '../types/future_either.dart';
import 'firebase_providers.dart';

part 'storage_provider.g.dart';

@Riverpod(keepAlive: true)
StorageRepository storageRepository(StorageRepositoryRef ref) {
  return StorageRepository(
    firebaseStorage:  ref.watch(storageProvider),
  );
}



class StorageRepository {
  final FirebaseStorage _firebaseStorage;

  StorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile({
    required String path,
    required String id,
    required File? file,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);
      UploadTask uploadTask;

      uploadTask = ref.putFile(file!);

      final snapshot = await uploadTask;

      return right(await snapshot.ref.getDownloadURL());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

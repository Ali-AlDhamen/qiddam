// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreHash() => r'e271f8f7be694ee819f397232f4d140c15a5f921';

/// See also [firestore].
@ProviderFor(firestore)
final firestoreProvider = Provider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRef = ProviderRef<FirebaseFirestore>;
String _$authHash() => r'e19802846b86cd7537e8fe263e26ab83f4ab7a63';

/// See also [auth].
@ProviderFor(auth)
final authProvider = Provider<FirebaseAuth>.internal(
  auth,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRef = ProviderRef<FirebaseAuth>;
String _$storageHash() => r'c8fff5c018231961d6b14c9c5d96ef438cda7ac1';

/// See also [storage].
@ProviderFor(storage)
final storageProvider = Provider<FirebaseStorage>.internal(
  storage,
  name: r'storageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageRef = ProviderRef<FirebaseStorage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

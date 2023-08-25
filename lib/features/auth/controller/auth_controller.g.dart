// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserDataHash() => r'4e10829c4ce6b722e0aa57d7058d425aad2fb361';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetUserDataRef = AutoDisposeStreamProviderRef<UserModel>;

/// See also [getUserData].
@ProviderFor(getUserData)
const getUserDataProvider = GetUserDataFamily();

/// See also [getUserData].
class GetUserDataFamily extends Family<AsyncValue<UserModel>> {
  /// See also [getUserData].
  const GetUserDataFamily();

  /// See also [getUserData].
  GetUserDataProvider call(
    String uid,
  ) {
    return GetUserDataProvider(
      uid,
    );
  }

  @override
  GetUserDataProvider getProviderOverride(
    covariant GetUserDataProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserDataProvider';
}

/// See also [getUserData].
class GetUserDataProvider extends AutoDisposeStreamProvider<UserModel> {
  /// See also [getUserData].
  GetUserDataProvider(
    this.uid,
  ) : super.internal(
          (ref) => getUserData(
            ref,
            uid,
          ),
          from: getUserDataProvider,
          name: r'getUserDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserDataHash,
          dependencies: GetUserDataFamily._dependencies,
          allTransitiveDependencies:
              GetUserDataFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is GetUserDataProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$authStateChangeHash() => r'6fddf39d9de32824cfbef219cf78a40d91f479df';

/// See also [authStateChange].
@ProviderFor(authStateChange)
final authStateChangeProvider = AutoDisposeStreamProvider<User?>.internal(
  authStateChange,
  name: r'authStateChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangeRef = AutoDisposeStreamProviderRef<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

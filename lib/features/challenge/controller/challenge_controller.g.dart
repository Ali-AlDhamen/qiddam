// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchChallengesHash() => r'322484b481a8bf7893aceac6a49dcf7a8ffe885d';

/// See also [watchChallenges].
@ProviderFor(watchChallenges)
final watchChallengesProvider =
    AutoDisposeStreamProvider<List<Challenge>>.internal(
  watchChallenges,
  name: r'watchChallengesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchChallengesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchChallengesRef = AutoDisposeStreamProviderRef<List<Challenge>>;
String _$watchUserChallengesHash() =>
    r'774aec6aeb6407272cd626bb13ec0b6f1a5b4a64';

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

typedef WatchUserChallengesRef = AutoDisposeStreamProviderRef<List<Challenge>>;

/// See also [watchUserChallenges].
@ProviderFor(watchUserChallenges)
const watchUserChallengesProvider = WatchUserChallengesFamily();

/// See also [watchUserChallenges].
class WatchUserChallengesFamily extends Family<AsyncValue<List<Challenge>>> {
  /// See also [watchUserChallenges].
  const WatchUserChallengesFamily();

  /// See also [watchUserChallenges].
  WatchUserChallengesProvider call(
    String userID,
  ) {
    return WatchUserChallengesProvider(
      userID,
    );
  }

  @override
  WatchUserChallengesProvider getProviderOverride(
    covariant WatchUserChallengesProvider provider,
  ) {
    return call(
      provider.userID,
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
  String? get name => r'watchUserChallengesProvider';
}

/// See also [watchUserChallenges].
class WatchUserChallengesProvider
    extends AutoDisposeStreamProvider<List<Challenge>> {
  /// See also [watchUserChallenges].
  WatchUserChallengesProvider(
    this.userID,
  ) : super.internal(
          (ref) => watchUserChallenges(
            ref,
            userID,
          ),
          from: watchUserChallengesProvider,
          name: r'watchUserChallengesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchUserChallengesHash,
          dependencies: WatchUserChallengesFamily._dependencies,
          allTransitiveDependencies:
              WatchUserChallengesFamily._allTransitiveDependencies,
        );

  final String userID;

  @override
  bool operator ==(Object other) {
    return other is WatchUserChallengesProvider && other.userID == userID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userID.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$watchCommentsHash() => r'4d9030c3e14ae52482e94c2ba897b728264a3a2f';
typedef WatchCommentsRef = AutoDisposeStreamProviderRef<List<Comment>>;

/// See also [watchComments].
@ProviderFor(watchComments)
const watchCommentsProvider = WatchCommentsFamily();

/// See also [watchComments].
class WatchCommentsFamily extends Family<AsyncValue<List<Comment>>> {
  /// See also [watchComments].
  const WatchCommentsFamily();

  /// See also [watchComments].
  WatchCommentsProvider call(
    String postID,
  ) {
    return WatchCommentsProvider(
      postID,
    );
  }

  @override
  WatchCommentsProvider getProviderOverride(
    covariant WatchCommentsProvider provider,
  ) {
    return call(
      provider.postID,
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
  String? get name => r'watchCommentsProvider';
}

/// See also [watchComments].
class WatchCommentsProvider extends AutoDisposeStreamProvider<List<Comment>> {
  /// See also [watchComments].
  WatchCommentsProvider(
    this.postID,
  ) : super.internal(
          (ref) => watchComments(
            ref,
            postID,
          ),
          from: watchCommentsProvider,
          name: r'watchCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCommentsHash,
          dependencies: WatchCommentsFamily._dependencies,
          allTransitiveDependencies:
              WatchCommentsFamily._allTransitiveDependencies,
        );

  final String postID;

  @override
  bool operator ==(Object other) {
    return other is WatchCommentsProvider && other.postID == postID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postID.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$watchChallengeHash() => r'eacd85e6065a1effd01bfbd9ae8d4e3f0b86124a';
typedef WatchChallengeRef = AutoDisposeStreamProviderRef<Challenge>;

/// See also [watchChallenge].
@ProviderFor(watchChallenge)
const watchChallengeProvider = WatchChallengeFamily();

/// See also [watchChallenge].
class WatchChallengeFamily extends Family<AsyncValue<Challenge>> {
  /// See also [watchChallenge].
  const WatchChallengeFamily();

  /// See also [watchChallenge].
  WatchChallengeProvider call(
    String challengeID,
  ) {
    return WatchChallengeProvider(
      challengeID,
    );
  }

  @override
  WatchChallengeProvider getProviderOverride(
    covariant WatchChallengeProvider provider,
  ) {
    return call(
      provider.challengeID,
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
  String? get name => r'watchChallengeProvider';
}

/// See also [watchChallenge].
class WatchChallengeProvider extends AutoDisposeStreamProvider<Challenge> {
  /// See also [watchChallenge].
  WatchChallengeProvider(
    this.challengeID,
  ) : super.internal(
          (ref) => watchChallenge(
            ref,
            challengeID,
          ),
          from: watchChallengeProvider,
          name: r'watchChallengeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchChallengeHash,
          dependencies: WatchChallengeFamily._dependencies,
          allTransitiveDependencies:
              WatchChallengeFamily._allTransitiveDependencies,
        );

  final String challengeID;

  @override
  bool operator ==(Object other) {
    return other is WatchChallengeProvider && other.challengeID == challengeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, challengeID.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

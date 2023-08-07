// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  return _Challenge.fromJson(json);
}

/// @nodoc
mixin _$Challenge {
  List<String> get participants => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeCopyWith<Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) then) =
      _$ChallengeCopyWithImpl<$Res, Challenge>;
  @useResult
  $Res call(
      {List<String> participants,
      String id,
      String title,
      String description,
      String userId,
      DateTime createdAt,
      int days});
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res, $Val extends Challenge>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChallengeCopyWith<$Res> implements $ChallengeCopyWith<$Res> {
  factory _$$_ChallengeCopyWith(
          _$_Challenge value, $Res Function(_$_Challenge) then) =
      __$$_ChallengeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> participants,
      String id,
      String title,
      String description,
      String userId,
      DateTime createdAt,
      int days});
}

/// @nodoc
class __$$_ChallengeCopyWithImpl<$Res>
    extends _$ChallengeCopyWithImpl<$Res, _$_Challenge>
    implements _$$_ChallengeCopyWith<$Res> {
  __$$_ChallengeCopyWithImpl(
      _$_Challenge _value, $Res Function(_$_Challenge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? days = null,
  }) {
    return _then(_$_Challenge(
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Challenge with DiagnosticableTreeMixin implements _Challenge {
  const _$_Challenge(
      {required final List<String> participants,
      required this.id,
      required this.title,
      required this.description,
      required this.userId,
      required this.createdAt,
      required this.days})
      : _participants = participants;

  factory _$_Challenge.fromJson(Map<String, dynamic> json) =>
      _$$_ChallengeFromJson(json);

  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final int days;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Challenge(participants: $participants, id: $id, title: $title, description: $description, userId: $userId, createdAt: $createdAt, days: $days)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Challenge'))
      ..add(DiagnosticsProperty('participants', participants))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('days', days));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Challenge &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.days, days) || other.days == days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_participants),
      id,
      title,
      description,
      userId,
      createdAt,
      days);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChallengeCopyWith<_$_Challenge> get copyWith =>
      __$$_ChallengeCopyWithImpl<_$_Challenge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChallengeToJson(
      this,
    );
  }
}

abstract class _Challenge implements Challenge {
  const factory _Challenge(
      {required final List<String> participants,
      required final String id,
      required final String title,
      required final String description,
      required final String userId,
      required final DateTime createdAt,
      required final int days}) = _$_Challenge;

  factory _Challenge.fromJson(Map<String, dynamic> json) =
      _$_Challenge.fromJson;

  @override
  List<String> get participants;
  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  int get days;
  @override
  @JsonKey(ignore: true)
  _$$_ChallengeCopyWith<_$_Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}

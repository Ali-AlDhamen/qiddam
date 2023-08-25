// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Challenge _$$_ChallengeFromJson(Map<String, dynamic> json) => _$_Challenge(
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      days: json['days'] as int,
    );

Map<String, dynamic> _$$_ChallengeToJson(_$_Challenge instance) =>
    <String, dynamic>{
      'participants': instance.participants,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'days': instance.days,
    };

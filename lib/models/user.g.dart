// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicUrl: json['profilePicUrl'] as String,
      friendIds:
          (json['friendIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicUrl': instance.profilePicUrl,
      'friendIds': instance.friendIds,
    };

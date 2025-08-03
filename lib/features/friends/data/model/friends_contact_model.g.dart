// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsContactModel _$FriendsContactModelFromJson(Map<String, dynamic> json) =>
    FriendsContactModel(
      id: json['id'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String?,
      isAppUser: json['isAppUser'] as bool,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$FriendsContactModelToJson(
        FriendsContactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'phone': instance.phone,
      'isAppUser': instance.isAppUser,
      'imageUrl': instance.imageUrl,
    };

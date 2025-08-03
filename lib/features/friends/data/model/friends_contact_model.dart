import 'package:json_annotation/json_annotation.dart';

part 'friends_contact_model.g.dart';

@JsonSerializable()
class FriendsContactModel {
  final String id;
  final String username;
  final String? phone;
  final bool isAppUser;
  final String? imageUrl;  // <-- هنا أضفت خاصية الصورة

  FriendsContactModel({
    required this.id,
    required this.username,
    this.phone,
    required this.isAppUser,
    this.imageUrl,         // أضفتها في الكونستركتور
  });

  factory FriendsContactModel.fromJson(Map<String, dynamic> json) =>
      _$FriendsContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsContactModelToJson(this);

  FriendsContactModel copyWith({
    String? id,
    String? username,
    String? phone,
    bool? isAppUser,
    String? imageUrl,     // أضفتها هنا أيضاً
  }) {
    return FriendsContactModel(
      id: id ?? this.id,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      isAppUser: isAppUser ?? this.isAppUser,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

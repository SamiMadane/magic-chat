
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String phone;
  final String username;
  final bool isLoggedIn;
  final String? imageUrl;
  

  UserModel({
    required this.phone,
    required this.username,
    this.isLoggedIn = false,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? phone,
    String? username,
    bool? isLoggedIn,
    String? imageUrl,
  }) {
    return UserModel(
      phone: phone ?? this.phone,
      username: username ?? this.username,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
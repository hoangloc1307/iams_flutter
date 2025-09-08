import 'package:iams_fe/domain/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String username;
  final String name;
  final String email;

  const UserResponse({
    required this.username,
    required this.name,
    required this.email,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toDomainUser() {
    return User(username: username, name: name, email: email);
  }
}

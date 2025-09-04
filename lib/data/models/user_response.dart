import 'package:json_annotation/json_annotation.dart';
import '../../domain/models/user/user.dart';

// Phải có dòng này để generate code
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

  // Factory constructor cho fromJson - gọi generated code
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  // Method toJson - gọi generated code
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  // Mapper to domain model
  User toDomainUser() {
    return User(username: username, name: name, email: email);
  }
}

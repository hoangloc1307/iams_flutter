import 'package:json_annotation/json_annotation.dart';
import 'user_response.dart';
import 'token.dart';

part 'auth_reponse.g.dart';

@JsonSerializable()
class AuthResponse {
  final UserResponse user;
  final Token tokens;

  const AuthResponse({required this.user, required this.tokens});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

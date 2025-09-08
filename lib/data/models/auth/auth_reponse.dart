import 'package:iams_fe/data/models/auth/token.dart';
import 'package:iams_fe/data/models/auth/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_reponse.g.dart';

@JsonSerializable()
class AuthResponse {
  final UserResponse user;
  final Token tokens;

  const AuthResponse({required this.user, required this.tokens});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

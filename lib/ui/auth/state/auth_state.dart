import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iams_fe/domain/models/user/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isAuthenticated,
    @Default(false) bool initialized,
    @Default(false) bool isLoading,
    User? user,
    String? errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState();
}

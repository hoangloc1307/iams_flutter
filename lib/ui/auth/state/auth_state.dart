import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isAuthenticated,
    @Default(true) bool isCheckingAuth,
    @Default(false) bool isLoading,
    User? user,
    String? errorMessage,
  }) = _AuthState;
}

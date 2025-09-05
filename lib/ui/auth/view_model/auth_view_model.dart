import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/auth_repository.dart';
import '../state/auth_state.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late final AuthRepository _repo;

  @override
  AuthState build() {
    _repo = ref.watch(authRepositoryProvider);
    Future.microtask(_restoreSession);
    return const AuthState();
  }

  Future<void> _restoreSession() async {
    state = state.copyWith(isLoading: true);

    final userResult = await _repo.getCurrentUser();

    userResult.fold(
      (error) {
        state = state.copyWith(isAuthenticated: false, isLoading: false);
      },
      (user) {
        state = state.copyWith(
          isAuthenticated: true,
          user: user,
          isLoading: false,
        );
      },
    );
  }

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true);

    final res = await _repo.login(username, password);

    res.fold(
      (errorMessage) {
        state = state.copyWith(isLoading: false, errorMessage: errorMessage);
      },
      (user) {
        state = state.copyWith(
          isAuthenticated: true,
          user: user,
          isLoading: false,
        );
      },
    );
  }

  // Future<void> logout() async {
  //   await _repo.logout();
  //   state = const AuthState();
  // }
}

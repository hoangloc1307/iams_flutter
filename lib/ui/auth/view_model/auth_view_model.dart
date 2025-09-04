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
    return const AuthState();
  }

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await _repo.login(username, password);
      state = state.copyWith(
        isAuthenticated: true,
        user: user,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  // Future<void> logout() async {
  //   await _repo.logout();
  //   state = const AuthState();
  // }
}

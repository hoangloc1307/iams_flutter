import 'package:iams_fe/data/repositories/auth_repository.dart';
import 'package:iams_fe/ui/auth/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late final AuthRepository _repo;

  @override
  AuthState build() {
    _repo = ref.watch(authRepositoryProvider);
    // Future.microtask(_restoreSession);
    _init();
    return const AuthState();
  }

  Future<void> _init() async {
    const minSplash = Duration(seconds: 2);
    final started = DateTime.now();

    final userResult = await _repo.getCurrentUser();

    final elapsed = DateTime.now().difference(started);
    if (elapsed < minSplash) {
      await Future.delayed(minSplash - elapsed);
    }

    userResult.fold(
      (error) {
        state = state.copyWith(
          isAuthenticated: false,
          isLoading: false,
          initialized: true,
        );
      },
      (user) {
        state = state.copyWith(
          isAuthenticated: true,
          user: user,
          isLoading: false,
          initialized: true,
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

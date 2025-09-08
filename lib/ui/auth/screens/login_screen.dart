import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/ui/auth/view_model/auth_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameCtl = TextEditingController();
  final _passwordCtl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  void dispose() {
    _usernameCtl.dispose();
    _passwordCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authViewModelProvider);

    // Lắng nghe thay đổi để show SnackBar / điều hướng
    ref.listen(authViewModelProvider, (prev, next) {
      // Lỗi chung
      if (prev?.errorMessage != next.errorMessage &&
          next.errorMessage != null &&
          next.errorMessage!.isNotEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _usernameCtl,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Vui lòng nhập username'
                        : null,
                    enabled: !state.isLoading,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordCtl,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: state.isLoading
                            ? null
                            : () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                    obscureText: _obscure,
                    textInputAction: TextInputAction.done,
                    validator: (v) => (v == null || v.isEmpty)
                        ? 'Vui lòng nhập mật khẩu'
                        : null,
                    enabled: !state.isLoading,
                    onFieldSubmitted: (_) => _onLogin(ref),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.isLoading ? null : () => _onLogin(ref),
                      child: state.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Đăng nhập'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Nếu muốn hiện lỗi chung dưới nút (ngoài SnackBar)
                  if (state.errorMessage != null &&
                      state.errorMessage!.isNotEmpty)
                    Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLogin(WidgetRef ref) {
    if (!_formKey.currentState!.validate()) return;
    ref
        .read(authViewModelProvider.notifier)
        .login(_usernameCtl.text.trim(), _passwordCtl.text);
  }
}

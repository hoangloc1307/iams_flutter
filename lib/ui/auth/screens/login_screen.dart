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
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    // Lắng nghe thay đổi để show SnackBar
    ref.listen(authViewModelProvider, (prev, next) {
      if (prev?.errorMessage != next.errorMessage &&
          (next.errorMessage?.isNotEmpty ?? false)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Đăng nhập', style: texts.headlineSmall),
        //   // Nếu bạn muốn AppBar theo primary:
        //   // backgroundColor: colors.primary,
        //   // foregroundColor: colors.onPrimary,
        // ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              color: colors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Chào mừng quay lại 👋',
                        style: texts.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Đăng nhập để tiếp tục làm việc trong hệ thống IAS.',
                        style: texts.bodyMedium,
                      ),
                      const SizedBox(height: 20),

                      // USERNAME
                      TextFormField(
                        controller: _usernameCtl,
                        enabled: !state.isLoading,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.username],
                        style: texts.bodyLarge,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: texts.bodyMedium,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: colors.secondary,
                          ),
                          filled: true,
                          fillColor: colors.surface,

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Vui lòng nhập username'
                            : null,
                      ),
                      const SizedBox(height: 12),

                      // PASSWORD
                      TextFormField(
                        controller: _passwordCtl,
                        enabled: !state.isLoading,
                        obscureText: _obscure,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        onFieldSubmitted: (_) =>
                            state.isLoading ? null : _onLogin(ref),
                        style: texts.bodyLarge,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: texts.bodyMedium,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: colors.secondary,
                          ),
                          suffixIcon: IconButton(
                            onPressed: state.isLoading
                                ? null
                                : () => setState(() => _obscure = !_obscure),
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: colors.secondary,
                            ),
                            tooltip: _obscure ? 'Hiện mật khẩu' : 'Ẩn mật khẩu',
                          ),
                          filled: true,
                          fillColor: colors.surface,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                        ),
                        validator: (v) => (v == null || v.isEmpty)
                            ? 'Vui lòng nhập mật khẩu'
                            : null,
                      ),
                      const SizedBox(height: 20),

                      // LOGIN BUTTON
                      SizedBox(
                        height: 44,
                        child: FilledButton(
                          // FilledButton mặc định lấy primary/onPrimary từ theme
                          onPressed: state.isLoading
                              ? null
                              : () => _onLogin(ref),
                          child: state.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text('Đăng nhập', style: texts.labelLarge),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // ERROR INLINE (tuỳ chọn)
                      if ((state.errorMessage?.isNotEmpty ?? false))
                        Text(
                          state.errorMessage!,
                          style: texts.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
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

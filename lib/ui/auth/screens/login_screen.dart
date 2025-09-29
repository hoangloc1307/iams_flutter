import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/themes/app_colors.dart';
import 'package:iams_fe/ui/auth/view_model/auth_view_model.dart';
import 'package:iams_fe/validations/validators.dart';

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

  void _onLogin(WidgetRef ref) {
    if (!_formKey.currentState!.validate()) return;

    ref
        .read(authViewModelProvider.notifier)
        .login(_usernameCtl.text.trim(), _passwordCtl.text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authViewModelProvider);
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 420),
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
                      '${'auth.welcomeBack'.tr()} 👋',
                      style: texts.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'auth.signInToWorkWith'.tr(
                        namedArgs: {'appName': 'IAMS'},
                      ),
                      style: texts.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    // USERNAME
                    TextFormField(
                      controller: _usernameCtl,
                      enabled: !state.isLoading,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.username],
                      autofocus: true,
                      style: texts.bodyLarge,
                      decoration: InputDecoration(
                        labelText: 'auth.username'.tr(),
                        labelStyle: texts.bodyMedium,
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: colors.primary,
                        ),
                        filled: true,
                        fillColor: colors.surface,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                      ),
                      validator: Validators.combine([
                        Validators.required(),
                        Validators.minLength(8),
                      ]),
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
                        labelText: 'auth.password'.tr(),
                        labelStyle: texts.bodyMedium,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: colors.primary,
                        ),
                        suffixIcon: IconButton(
                          onPressed: state.isLoading
                              ? null
                              : () => setState(() => _obscure = !_obscure),
                          icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility,
                            color: colors.primary,
                          ),
                          tooltip: _obscure
                              ? 'auth.showPassword'.tr()
                              : 'auth.hidePassword'.tr(),
                        ),
                        filled: true,
                        fillColor: colors.surface,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                      ),
                      validator: Validators.required(),
                    ),
                    const SizedBox(height: 20),
                    // LOGIN BUTTON
                    SizedBox(
                      height: 44,
                      child: FilledButton(
                        onPressed: state.isLoading ? null : () => _onLogin(ref),
                        child: state.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'auth.signIn'.tr(),
                                style: TextStyle(
                                  color: AppColors.onPrimaryLight,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ERROR
                    if ((state.errorMessage?.isNotEmpty ?? false))
                      Text(
                        state.errorMessage!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: colors.error),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

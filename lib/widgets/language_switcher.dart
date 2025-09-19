import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LangButton(
          emoji: '🇻🇳',
          code: 'vi',
          active: locale.languageCode == 'vi',
          onTap: () => context.setLocale(const Locale('vi')),
        ),
        const SizedBox(width: 8),
        _LangButton(
          emoji: '🇺🇸',
          code: 'en',
          active: locale.languageCode == 'en',
          onTap: () => context.setLocale(const Locale('en')),
        ),
      ],
    );
  }
}

class _LangButton extends StatelessWidget {
  final String emoji;
  final String code;
  final bool active;
  final VoidCallback onTap;

  const _LangButton({
    required this.emoji,
    required this.code,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active
              ? colors.primary.withValues(alpha: 0.25)
              : Colors.transparent,
          border: Border.all(color: active ? colors.primary : colors.outline),
        ),
        child: Text(emoji, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

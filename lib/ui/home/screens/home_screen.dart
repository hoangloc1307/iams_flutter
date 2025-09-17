import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/translations/i18n.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);

    return Column(
      children: [
        Text(i18n.t('home_screen')),
        Row(
          children: [
            Text(i18n.t('hello', namedArgs: {'name': 'Lộc'})),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                i18n.setLocale(const Locale('vi'));
              },
              child: const Text('Tiếng Việt'),
            ),
            ElevatedButton(
              onPressed: () {
                i18n.setLocale(const Locale('en'));
              },
              child: const Text('English'),
            ),
          ],
        ),
      ],
    );
  }
}

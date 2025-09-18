import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/i18n/i18n.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(I18n.t('home.homeScreen')),
        Row(
          children: [
            // Text('hello'.t(context, namedArgs: {'name': 'Lộc'})),
            // Text(i18n.t('hello', namedArgs: {'name': 'Lộc'})),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                I18n.setLocale(context, const Locale('vi'));
              },
              child: const Text('Tiếng Việt'),
            ),
            ElevatedButton(
              onPressed: () {
                I18n.setLocale(context, const Locale('en'));
              },
              child: const Text('English'),
            ),
          ],
        ),
      ],
    );
  }
}

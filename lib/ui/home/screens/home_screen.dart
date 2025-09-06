import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iams_fe/translations/i18n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('home_screen'.tr()),
        Row(
          children: [
            Text('hello'.tr(namedArgs: {'name': 'Lộc'})),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                context.setLocale(const Locale('vi'));
              },
              child: const Text('Tiếng Việt'),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(const Locale('en'));
              },
              child: const Text('English'),
            ),
          ],
        ),
      ],
    );
  }
}

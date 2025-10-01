import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/ui/auth/view_model/auth_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text('home.homeScreen'.tr()),
        ElevatedButton(
          onPressed: () => {ref.read(authViewModelProvider.notifier).logout()},
          child: Text('Logout'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iams_fe/constants/contants.dart';
import 'package:iams_fe/ui/layout/drawer/drawer_tree.dart';

class MasterLayout extends ConsumerWidget {
  const MasterLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text(Contants.appShortName)),
      endDrawer: SafeArea(child: Drawer(child: DrawerTree())),
      body: child,
    );
  }
}

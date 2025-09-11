import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iams_fe/routing/routes.dart';

class MasterLayout extends ConsumerWidget {
  const MasterLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String current = GoRouterState.of(context).uri.toString();

    void go(String path) {
      if (current != path) context.go(path);
      Navigator.of(context).maybePop(); // đóng Drawer nếu đang mở
    }

    return Scaffold(
      appBar: AppBar(title: const Text('IAMS')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu', style: TextStyle(fontSize: 18)),
            ),
            _DrawerTile(
              icon: Icons.home_outlined,
              title: 'Dashboard',
              selected: current == Routes.home,
              onTap: () => go(Routes.home),
            ),
            _DrawerTile(
              icon: Icons.home_outlined,
              title: 'Assets',
              selected: current == Routes.assets,
              onTap: () => go(Routes.assets),
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.icon,
    required this.title,
    this.selected = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: selected,
      onTap: onTap,
    );
  }
}

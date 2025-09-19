import 'package:flutter/material.dart';
import 'package:iams_fe/routing/routes.dart';

class DrawerNode {
  final String title;
  final IconData icon;
  final String? route;
  final List<DrawerNode> children;

  const DrawerNode({
    required this.title,
    required this.icon,
    this.route,
    this.children = const [],
  });

  bool get isLeaf => children.isEmpty;
}

final drawerConfig = <DrawerNode>[
  DrawerNode(title: 'navigation.home', icon: Icons.home, route: Routes.home),
  DrawerNode(
    title: 'navigation.asset',
    icon: Icons.devices,
    children: [
      DrawerNode(
        title: 'navigation.category',
        icon: Icons.category,
        route: '/asset/category',
      ),
      DrawerNode(
        title: 'navigation.inventory',
        icon: Icons.inventory,
        route: '/asset/inventory',
      ),
    ],
  ),
];

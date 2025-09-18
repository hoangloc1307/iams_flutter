import 'package:flutter/material.dart';

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
  DrawerNode(title: 'navigation.home', icon: Icons.home, route: '/home'),
  DrawerNode(
    title: 'navigation.asset',
    icon: Icons.devices,
    route: '/assets',
    children: [
      DrawerNode(title: 'navigation.category', icon: Icons.category),
      DrawerNode(title: 'navigation.inventory', icon: Icons.inventory),
    ],
  ),
];

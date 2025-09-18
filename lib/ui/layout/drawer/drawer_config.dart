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

const drawerConfig = <DrawerNode>[
  DrawerNode(
    title: 'Tài liệu',
    icon: Icons.folder,
    children: [
      DrawerNode(
        title: 'Hợp đồng',
        icon: Icons.description,
        route: '/contracts',
      ),
      DrawerNode(
        title: 'Biên bản',
        icon: Icons.insert_drive_file,
        children: [
          DrawerNode(
            title: 'PDF',
            icon: Icons.picture_as_pdf,
            route: '/minutes/pdf',
          ),
          DrawerNode(
            title: 'Word',
            icon: Icons.text_snippet,
            route: '/minutes/word',
          ),
        ],
      ),
    ],
  ),
  DrawerNode(title: 'Cài đặt', icon: Icons.settings, route: '/settings'),
];

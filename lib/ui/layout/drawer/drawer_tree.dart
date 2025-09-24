import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iams_fe/constants/assets.dart';
import 'package:iams_fe/ui/layout/drawer/drawer_config.dart';
import 'package:iams_fe/widgets/language_switcher.dart';

class DrawerTree extends StatelessWidget {
  const DrawerTree({super.key});

  final double indentStep = 12;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Image.asset(
              Assets.nokLogoWhite,
              width: 100,
              fit: BoxFit.contain,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Color.fromRGBO(0, 0, 120, 1),
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
        ),
        LanguageSwitcher(),
        ..._buildNodes(context, drawerConfig, 0),
      ],
    );
  }

  List<Widget> _buildNodes(
    BuildContext context,
    List<DrawerNode> nodes,
    int depth,
  ) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    return nodes.map((n) {
      final padding = EdgeInsets.only(left: depth * indentStep);
      final isSelected =
          n.route != null && currentLocation.startsWith(n.route!);

      if (n.isLeaf) {
        return Padding(
          padding: padding,
          child: ListTile(
            leading: Icon(n.icon),
            title: Text(n.title.tr()),
            selected: isSelected,
            onTap: n.route == null
                ? null
                : () {
                    Navigator.of(context).pop();
                    context.go(n.route!);
                  },
          ),
        );
      }

      return Padding(
        padding: padding,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Icon(n.icon),
            title: Text(n.title.tr()),
            initiallyExpanded: _shouldExpand(currentLocation, n),
            children: _buildNodes(context, n.children, depth + 1),
          ),
        ),
      );
    }).toList();
  }

  bool _shouldExpand(String loc, DrawerNode parent) {
    bool match(DrawerNode n) {
      if (n.route != null && loc.startsWith(n.route!)) return true;
      return n.children.any(match);
    }

    return parent.children.any(match);
  }
}

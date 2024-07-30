import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/src/menus/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 25;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value - 1];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 20)),
          const NavigationDrawerDestination(
            icon: Icon(Icons.add),
            label: Text('Home Screen'),
          ),
          ...appMenuItems.sublist(0, 3).map(
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
              child: Text('More options')),
          ...appMenuItems.sublist(3).map(
                (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ),
        ]);
  }
}

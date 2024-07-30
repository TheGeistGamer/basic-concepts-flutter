import 'package:widgets_app/src/widgets/side_menu.dart';
import 'package:widgets_app/src/menus/menu_items.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  static const String name = 'home_screens';

  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Flutter + Material 3'),
        ),
        body: const _HomeView(),
        drawer: SideMenu(
          scaffoldKey: scaffoldKey,
        ));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];

          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios, color: color.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.pushNamed(context, menuItem.link);
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const ButtonsScreen()));

        context.push(menuItem.link);
      },
    );
  }
}

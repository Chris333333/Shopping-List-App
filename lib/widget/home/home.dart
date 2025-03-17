import 'package:flutter/material.dart';
import 'package:shopping_list/routes/routes.dart';
import 'package:shopping_list/widget/drawer/drawer_menu.dart';
import 'package:shopping_list/widget/home/home_screen.page.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Widget _bodyContent;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _bodyContent = HomeScreenPage();
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _openDrawer();
            },
            tooltip: "Otwórz menu",
          ),
        ),
        body: SubNavigator(navigatorKey: Routes.mainNavigatorKey, initialRoute: Routes.PAGE_HOME, key: _navigatorKey),
        drawer: DrawerMenu(),
      ),
    );
  }
}
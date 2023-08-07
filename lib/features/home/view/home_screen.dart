import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/features/home/view/widgets/active_icon.dart';

import '../../../theme/app_theme.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppTheme.whiteColor,
        // backgroundColor: Colors.amber,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,

        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(
            selectedIcon: ActiveIcon(
              icon: Icons.home_outlined,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: "home",
          ),
          NavigationDestination(
            selectedIcon: ActiveIcon(
              icon: Icons.person_outline,
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
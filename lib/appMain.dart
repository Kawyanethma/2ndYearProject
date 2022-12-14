import 'package:flutter/material.dart';

import 'package:animations/animations.dart';
import 'package:gpsd/pages/account/account.dart';
import 'package:gpsd/pages/home/homePage.dart';
import 'package:gpsd/pages/settings/settings.dart';


class AppMain extends StatefulWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int index = 1;
  final screens = [
    const AccountPage(),
    const HomePage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: PageTransitionSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: screens[index],
          ),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )),
            child: NavigationBar(
                backgroundColor: Colors.grey[250],
                elevation: 40,
                height: 60,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: index,
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.account_circle_outlined),
                      selectedIcon: Icon(Icons.account_circle),
                      label: "Account"),
                  NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: "Home"),
                  NavigationDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: "Settings"),
                ]),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:x_clone/core/extensions/context_extensions.dart';
import 'package:x_clone/core/utils/navbar_utils.dart';
import 'package:x_clone/ui/home/home_page.dart';
import 'package:x_clone/ui/profile/profile_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colorScheme.surface,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: context.colorScheme.primary,
        unselectedItemColor: context.colorScheme.onSurface,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: appBarDestinations,
      ),
      body: <Widget>[
        const HomePage(),
        const HomePage(),
        const HomePage(),
        const ProfilePage(),
      ][selectedIndex],
    );
  }
}

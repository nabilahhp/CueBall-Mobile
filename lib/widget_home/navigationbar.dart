import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_bl/RegisterPage.dart';
import 'package:mobile_bl/home.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    home(),
    RegisterPage(),
    // home(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.yellow, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'User',
          ),
        ],
      ),
    );
  }
}

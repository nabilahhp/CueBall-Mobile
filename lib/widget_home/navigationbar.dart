import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_bl/RegisterPage.dart';
import 'package:mobile_bl/home.dart';
import 'package:mobile_bl/profile/profile_screen.dart';
import 'package:mobile_bl/screens/activity_screen.dart';
import 'package:mobile_bl/widget_home/detail_food.dart';


class NavigationMenu extends StatefulWidget {
  final String idUser;
  final int selectedIndex; // Tambahkan parameter selectedIndex
  const NavigationMenu({Key? key, required this.idUser, required this.selectedIndex}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;
  late List<Widget> _pages; // Buat variabel _pages di sini

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; // Gunakan nilai selectedIndex yang diberikan
    _pages = [
      home(idUser: widget.idUser),
      ActivityPage(idUser: widget.idUser), // Gunakan widget.idUser di sini
      ProfileScreen()
    ];
  }

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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



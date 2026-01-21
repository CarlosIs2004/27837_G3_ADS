import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 1, // pestaña activa = Clases
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(8,153,253,1.0),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: "Clases"),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart_sharp), label: "Reportes"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Perfil"),
        ],
    );
  }
}

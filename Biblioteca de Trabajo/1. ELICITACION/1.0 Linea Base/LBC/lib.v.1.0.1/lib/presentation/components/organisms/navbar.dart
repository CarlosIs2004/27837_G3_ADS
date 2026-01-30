import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Usamos NavigationBarTheme para personalizar los colores más a fondo si es necesario
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        // Color del texto de las etiquetas
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          // Estilo cuando esta seleccionado
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: Color.fromRGBO(8,153,253,1.0),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            );
          }

          // Estilo cuando no esta seleccionado
          return const TextStyle(
            color: Colors.grey,
            fontSize: 10,
          );
        }),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        backgroundColor: Colors.white, // Fondo de toda la barra

        indicatorColor: Colors.transparent, // EL FONDO DEL ÍCONO SELECCIONADO (Estilo WhatsApp)

        // Opcional: Para hacer la barra más baja y parecida a la antigua
        height: 65,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_filled, color: Colors.grey), // Ícono normal
            selectedIcon: Icon(Icons.home_filled, color: Color.fromRGBO(8,153,253,1.0)), // Ícono normal
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined, color: Colors.grey),
            selectedIcon: Icon(Icons.menu_book_outlined, color: Color.fromRGBO(8,153,253,1.0)),
            label: 'Clases',
          ),
          NavigationDestination(
            icon: Icon(Icons.insert_chart_sharp, color: Colors.grey),
            selectedIcon: Icon(Icons.insert_chart_sharp, color: Color.fromRGBO(8,153,253,1.0)),
            label: 'Reportes',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box, color: Colors.grey),
            selectedIcon: Icon(Icons.account_box, color: Color.fromRGBO(8,153,253,1.0)),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
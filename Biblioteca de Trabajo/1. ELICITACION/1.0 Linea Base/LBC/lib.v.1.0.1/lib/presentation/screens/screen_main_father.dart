
import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/atoms/custom_text.dart';
import 'package:mingo/presentation/components/organisms/navbar.dart';
import 'package:mingo/presentation/screens/screen_menu_class.dart';
import 'package:mingo/presentation/screens/screen_profile.dart';

class ScreenMainFather extends StatefulWidget {
  const ScreenMainFather({super.key});

  @override
  State<ScreenMainFather> createState() => _ScreenMainFatherState();
}

class _ScreenMainFatherState extends State<ScreenMainFather> {
  int _currentIndex = 0;

  //Aqui van la lista de las paginas a donde quiero dirijirme
  final List<Widget> _pages = [
    Scaffold(
      body: Center(
        child: CustomText(
          fontSize: 23,
          color: Colors.black,
          textAlign: TextAlign.center,
          text: 'Inicio',
        ),
      )
    ),
    ScreenMenuClass(),
    Scaffold(
        body: Center(
          child: CustomText(
            fontSize: 23,
            color: Colors.black,
            textAlign: TextAlign.center,
            text: 'Reportes',
          ),
        )
    ),
    ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: NavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}



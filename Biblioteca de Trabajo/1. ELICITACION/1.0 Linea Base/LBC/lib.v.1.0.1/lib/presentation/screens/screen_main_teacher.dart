import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/atoms/custom_text.dart';
import 'package:mingo/presentation/components/organisms/navbar.dart';
import 'package:mingo/presentation/screens/screen_class_teacher.dart';
import 'package:mingo/presentation/screens/screen_menu_major.dart';
import 'package:mingo/presentation/screens/screen_profile.dart';

class ScreenMainTeacher extends StatefulWidget {
  const ScreenMainTeacher({super.key});

  @override
  State<ScreenMainTeacher> createState() => _ScreenMainTeacherState();
}

class _ScreenMainTeacherState extends State<ScreenMainTeacher> {
  int _currentIndex = 0;

  //Aqui van la lista de las paginas a donde quiero dirijirme
  final List<Widget> _pages = [
    ScreenMenuMajor(),
    ScreenClassTeacher(),
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

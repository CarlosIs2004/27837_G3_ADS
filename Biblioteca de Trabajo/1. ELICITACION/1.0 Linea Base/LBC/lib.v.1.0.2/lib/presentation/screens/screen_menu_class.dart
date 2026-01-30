import 'package:flutter/material.dart';
import 'package:mingo/presentation/screens/screen_content_advanced.dart';
import 'package:mingo/presentation/screens/screen_content_beginner.dart';
import 'package:mingo/presentation/screens/screen_content_interminate.dart';
import 'package:mingo/presentation/templates/menu_class_template.dart';

class ScreenMenuClass extends StatefulWidget {
  const ScreenMenuClass({super.key});

  @override
  State<ScreenMenuClass> createState() => _ScreenMenuClassState();
}

class _ScreenMenuClassState extends State<ScreenMenuClass> {
  @override
  Widget build(BuildContext context) {
    return MenuClassTemplate(
      onPrincipianteTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ScreenContentBeginner()),
        );
      },
      onIntermedioTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ScreenContentInterminate()),
        );
      },
      onAvanzadoTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ScreenContentAdvanced()),
        );
      }
    );
  }
}

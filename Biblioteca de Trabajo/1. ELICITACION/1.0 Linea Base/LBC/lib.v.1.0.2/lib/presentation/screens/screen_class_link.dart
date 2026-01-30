import 'package:flutter/material.dart';
import 'package:mingo/data/repository/code_repository.dart';
import 'package:mingo/presentation/screens/screen_main_father.dart';
import 'package:mingo/presentation/templates/class_link_template.dart';

class ScreenClassLink extends StatefulWidget {
  const ScreenClassLink({super.key});

  @override
  State<ScreenClassLink> createState() => _ScreenClassLinkState();
}

class _ScreenClassLinkState extends State<ScreenClassLink> {

  final linkCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClassLinkTemplate(
      nombreCtrl: linkCtrl,
      onPressed: () async {

        var response = await CodeRepository().verifyCode(linkCtrl.text);
        if (response) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ScreenMainFather()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Código incorrecto', textAlign: TextAlign.center,),
            ),
          );
        }
      }
    );
  }
}

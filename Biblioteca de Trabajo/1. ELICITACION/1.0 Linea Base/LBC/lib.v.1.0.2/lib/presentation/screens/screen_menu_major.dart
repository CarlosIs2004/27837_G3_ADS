import 'package:flutter/material.dart';
import 'package:mingo/presentation/screens/screen_generate_code.dart';
import 'package:mingo/presentation/screens/screen_import_content.dart';
import 'package:mingo/presentation/templates/menu_class_teacher_template.dart';

class ScreenMenuMajor extends StatefulWidget {
  const ScreenMenuMajor({super.key});

  @override
  State<ScreenMenuMajor> createState() => _ScreenMenuMajorState();
}

class _ScreenMenuMajorState extends State<ScreenMenuMajor> {
  @override
  Widget build(BuildContext context) {
    return MenuClassTeacherTemplate(
      viewProgress: (){
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => const ScreenContentAdvanced()),
        // );
      },
      importContent: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ScreenImportContent()),
        );
      },
      generateCode: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ScreenGenerateCode()),
        );
      }
    );
  }
}

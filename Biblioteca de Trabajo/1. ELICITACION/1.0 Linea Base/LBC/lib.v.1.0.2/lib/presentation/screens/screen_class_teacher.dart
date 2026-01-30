import 'package:flutter/material.dart';
import 'package:mingo/presentation/templates/class_teachear_template.dart';

class ScreenClassTeacher extends StatefulWidget {
  const ScreenClassTeacher({super.key});

  @override
  State<ScreenClassTeacher> createState() => _ScreenClassTeacherState();
}

class _ScreenClassTeacherState extends State<ScreenClassTeacher> {
  @override
  Widget build(BuildContext context) {
    return ClassTeachearTemplate();
  }
}

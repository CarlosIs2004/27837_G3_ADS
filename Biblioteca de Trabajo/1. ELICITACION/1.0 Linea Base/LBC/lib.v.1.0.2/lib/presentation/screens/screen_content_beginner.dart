import 'package:flutter/material.dart';
import 'package:mingo/presentation/templates/content_beginner_template.dart';

class ScreenContentBeginner extends StatefulWidget {
  const ScreenContentBeginner({super.key});

  @override
  State<ScreenContentBeginner> createState() => _ScreenContentBeginnerState();
}

class _ScreenContentBeginnerState extends State<ScreenContentBeginner> {
  @override
  Widget build(BuildContext context) {
    return ContentBeginnerTemplate();
  }
}

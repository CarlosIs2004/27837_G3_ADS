import 'package:flutter/material.dart';
import 'package:mingo/presentation/templates/generate_code_template.dart';

class ScreenGenerateCode extends StatefulWidget {
  const ScreenGenerateCode({super.key});

  @override
  State<ScreenGenerateCode> createState() => _ScreenGenerateCodeState();
}

class _ScreenGenerateCodeState extends State<ScreenGenerateCode> {
  @override
  Widget build(BuildContext context) {
    return GenerateCodeTemplate();
  }
}

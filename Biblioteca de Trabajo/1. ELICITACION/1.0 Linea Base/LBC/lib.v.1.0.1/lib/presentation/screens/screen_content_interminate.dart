import 'package:flutter/material.dart';
import 'package:mingo/presentation/templates/content_intermediate_template.dart';

class ScreenContentInterminate extends StatefulWidget {
  const ScreenContentInterminate({super.key});

  @override
  State<ScreenContentInterminate> createState() => _ScreenContentInterminateState();
}

class _ScreenContentInterminateState extends State<ScreenContentInterminate> {
  @override
  Widget build(BuildContext context) {
    return ContentIntermediateTemplate();
  }
}

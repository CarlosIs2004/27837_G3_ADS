import 'package:flutter/material.dart';
import 'package:mingo/presentation/templates/content_advanced_template.dart';

class ScreenContentAdvanced extends StatefulWidget {
  const ScreenContentAdvanced({super.key});

  @override
  State<ScreenContentAdvanced> createState() => _ScreenContentAdvancedState();
}

class _ScreenContentAdvancedState extends State<ScreenContentAdvanced> {
  @override
  Widget build(BuildContext context) {
    return ContentAdvancedTemplate();
  }
}

import 'package:flutter/material.dart';
import 'package:mingo/views/templates/advanced_template.dart';

class AdvancedView extends StatefulWidget {
  const AdvancedView({super.key});

  @override
  State<AdvancedView> createState() => _AdvancedViewState();
}

class _AdvancedViewState extends State<AdvancedView> {
  @override
  Widget build(BuildContext context) {
    return AdvancedTemplate();
  }
}
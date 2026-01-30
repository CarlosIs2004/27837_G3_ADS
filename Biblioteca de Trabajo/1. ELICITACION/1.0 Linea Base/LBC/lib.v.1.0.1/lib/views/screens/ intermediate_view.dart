import 'package:flutter/material.dart';
import 'package:mingo/views/templates/intermediate_template.dart';

class IntermediateView extends StatefulWidget {
  const  IntermediateView({super.key});

  @override
  State< IntermediateView> createState() => _intermediateViewState();
}

class _intermediateViewState extends State< IntermediateView> {
  @override
  Widget build(BuildContext context) {
    return IntermediateTemplate();
  }
}
import 'package:flutter/material.dart';
import 'package:mingo/views/templates/beginner_template.dart';

class BeginnerView extends StatefulWidget {
  const BeginnerView({super.key});

  @override
  State<BeginnerView> createState() => _BeginnerViewState();
}

class _BeginnerViewState extends State<BeginnerView> {
  @override
  Widget build(BuildContext context) {
    return BeginnerTemplate();
  }
}
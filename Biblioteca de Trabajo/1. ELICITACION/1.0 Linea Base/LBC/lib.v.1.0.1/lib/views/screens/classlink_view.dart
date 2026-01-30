import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingo/views/templates/classlink_template.dart';

class ClasslinkView extends StatefulWidget {
  const ClasslinkView({super.key});

  @override
  State<ClasslinkView> createState() => _ClasslinkViewState();
}

class _ClasslinkViewState extends State<ClasslinkView> {
  final linkCtrl = TextEditingController();
  void _enterLink() {
    context.go('/menuclass');
  }

  @override
  Widget build(BuildContext context) {
    return ClasslinkTemplate(
      nombreCtrl: linkCtrl,
      onPressed: () => _enterLink(),
    );
  }
}

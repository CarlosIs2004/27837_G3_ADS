import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';

class ProfileTemplate extends StatelessWidget {
  final Widget body;

  const ProfileTemplate({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const TollBar(titlePage: 'Mi Perfil', reverse: true),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: body,
      ),
    );
  }
}
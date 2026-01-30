import 'package:flutter/material.dart';
import 'package:mingo/views/components/molecules/navbar.dart';
import 'package:mingo/views/components/molecules/tollbar.dart';

class AdvancedTemplate extends StatelessWidget {
  const AdvancedTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220,231,251,1.0),
      appBar: Tollbar(titlePage: 'Nivel Avanzado', reverse: true,),
      body: const Center(
        child: Text(
          'Contenido del nivel avanzado',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
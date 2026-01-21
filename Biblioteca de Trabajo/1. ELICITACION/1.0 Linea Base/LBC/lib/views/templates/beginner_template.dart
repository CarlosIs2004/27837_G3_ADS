import 'package:flutter/material.dart';
import 'package:mingo/views/components/molecules/navbar.dart';
import 'package:mingo/views/components/molecules/tollbar.dart';

class BeginnerTemplate extends StatelessWidget {
  const BeginnerTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220,231,251,1.0),
      appBar: Tollbar(titlePage: 'Nivel Principiante', reverse: true,),
      body: const Center(
        child: Text(
          'Contenido del nivel principiante',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mingo/views/components/molecules/navbar.dart';
import 'package:mingo/views/components/molecules/tollbar.dart';
import 'package:mingo/views/components/organisms/classlink.dart';



class ClasslinkTemplate extends StatelessWidget {

  final TextEditingController nombreCtrl;
  final VoidCallback onPressed;

  const ClasslinkTemplate({super.key, required this.nombreCtrl, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220,231,251,1.0),
      appBar: Tollbar(titlePage: 'Enlazar Clase', reverse: true,),
      body: ClassLink(nombreCtrl: nombreCtrl, onPressed: onPressed),
      bottomNavigationBar: NavBar()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/classlink/class_link.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';

class ClassLinkTemplate extends StatefulWidget {

  final TextEditingController nombreCtrl;
  final VoidCallback onPressed;

  const ClassLinkTemplate({super.key, required this.nombreCtrl, required this.onPressed});

  @override
  State<ClassLinkTemplate> createState() => _ClassLinkTemplateState();
}

class _ClassLinkTemplateState extends State<ClassLinkTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TollBar(titlePage: 'Enlazar Clase', reverse: true,),
      ),
      backgroundColor: Color.fromRGBO(192, 223, 254, 1.0),
      body: ClassLink(nombreCtrl: widget.nombreCtrl, onPressed: widget.onPressed),
    );
  }
}

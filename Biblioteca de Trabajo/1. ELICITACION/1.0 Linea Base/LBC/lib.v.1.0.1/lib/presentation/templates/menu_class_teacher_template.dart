import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';

import '../components/organisms/optionsclass/menu_class_list.dart';


class MenuClassTeacherTemplate extends StatefulWidget {

  final VoidCallback viewProgress;
  final VoidCallback importContent;
  final VoidCallback generateCode;

  const MenuClassTeacherTemplate({super.key, required this.viewProgress, required this.importContent, required this.generateCode});

  @override
  State<MenuClassTeacherTemplate> createState() => _MenuClassTeacherTemplateState();
}

class _MenuClassTeacherTemplateState extends State<MenuClassTeacherTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 223, 254, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TollBar(titlePage: 'Menú Principal', reverse: true),
      ),
      // Al usar resizeToAvoidBottomInset: false, evitas que el teclado empuje el diseño
      resizeToAvoidBottomInset: false,
      body: Center( // 1. Centra el contenido horizontalmente
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: MenuClassList(
              viewProgress: widget.viewProgress,
              importContent: widget.importContent,
              generateCode: widget.generateCode,
            ),
          ),
        ),
      ),
    );
  }
}
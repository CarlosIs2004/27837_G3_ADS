import 'package:flutter/material.dart';
import 'package:mingo/views/components/atoms/custom_text.dart';
import 'package:mingo/views/components/atoms/custom_text_button.dart';

class DownloadContentForm extends StatefulWidget {
  const DownloadContentForm({super.key});

  @override
  State<DownloadContentForm> createState() => _DownloadContentFormState();
}

class _DownloadContentFormState extends State<DownloadContentForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(text: 'Nivel de Aprendizaje', fontSize: 20),
            CustomTextButton(onPressed: (){}, text: 'Principiante'),
            const SizedBox(height: 10),
            CustomTextButton(onPressed: (){}, text: 'Intermedio'),
            const SizedBox(height: 10),
            CustomTextButton(onPressed: (){}, text: 'Avanzado'),
            const SizedBox(height: 10),
            CustomTextButton(onPressed: (){}, text: 'Descargar Contenido'),
            const SizedBox(height: 10),
            CustomText(text: 'Descargando', fontSize: 20)
          ],
        ),
      )
    );
  }
}

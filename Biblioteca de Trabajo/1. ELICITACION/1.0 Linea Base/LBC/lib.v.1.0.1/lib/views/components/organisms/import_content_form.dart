import 'package:flutter/material.dart';
import 'package:mingo/views/components/atoms/custom_drop_down.dart';
import 'package:mingo/views/components/atoms/custom_text.dart';
import 'package:mingo/views/components/atoms/custom_text_button.dart';
import 'package:mingo/views/components/atoms/input_field.dart';

class ImportContentForm extends StatefulWidget {
  final TextEditingController phraseCtrl;
  final TextEditingController titleCtrl;

  const ImportContentForm({
    super.key,
    required this.phraseCtrl,
    required this.titleCtrl
  });

  @override
  State<ImportContentForm> createState() => _ImportContentFormState();
}

class _ImportContentFormState extends State<ImportContentForm> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Para que ocupen todo el ancho
            children: [

              // --- SECCIÓN 1: ARCHIVOS MULTIMEDIA ---
              _buildSectionCard(
                children: [
                  CustomText(text: 'Archivos Multimedia', fontSize: 18),
                  const SizedBox(height: 15),

                  // Botones de subida (Asumiendo que tus CustomTextButton se expanden o usando Row)
                  CustomTextButton(onPressed: () {}, text: 'Subir Video'), // Intenta ponerles un color azul de fondo en tu atom
                  const SizedBox(height: 10),
                  CustomTextButton(onPressed: () {}, text: 'Subir Imagen'),

                  const SizedBox(height: 15),
                  CustomText(text: 'Frase Asociada', fontSize: 14), // Label visual
                  const SizedBox(height: 5),
                  InputField(
                      label: 'Ingresa la frase asociada a la seña',
                      controller: widget.phraseCtrl
                  ),
                ],
              ),

              const SizedBox(height: 20), // Separación entre los dos grandes bloques

              // --- SECCIÓN 2: DETALLES DEL CONTENIDO ---
              _buildSectionCard(
                children: [
                  CustomText(text: 'Detalles del Contenido', fontSize: 18),
                  const SizedBox(height: 15),

                  CustomText(text: 'Título del Contenido', fontSize: 15),
                  const SizedBox(height: 5),
                  InputField(label: 'Ej. Saludo de Buenos Días', controller: widget.titleCtrl),

                  const SizedBox(height: 15),
                  CustomText(text: 'Categoría de Edad', fontSize: 15),
                  const SizedBox(height: 5),
                  CustomDropDown(
                    items: const ['Niño', 'Adolescente', 'Adulto'],
                    onChanged: (value) {},
                    hint: 'Selecciona una categoría',
                  ),

                  const SizedBox(height: 15),
                  CustomText(text: 'Nivel Educativo', fontSize: 15),
                  const SizedBox(height: 5),
                  CustomDropDown(
                    items: const ['Básico', 'Intermedio', 'Avanzado'],
                    onChanged: (value) {},
                    hint: 'Selecciona un nivel',
                  ),

                  const SizedBox(height: 15),
                  CustomText(text: 'Frases Asociadas a la Seña', fontSize: 15),
                  const SizedBox(height: 5),
                  // Nota: Si tu InputField soporta maxLines, pásale maxLines: 3 aquí para que parezca un área de texto
                  InputField(
                      label: 'Ingresa frases adicionales separadas por comas',
                      controller: widget.titleCtrl // ¡Cuidado! Usabas el mismo controller, deberías tener uno distinto
                  ),

                  const SizedBox(height: 15),
                  CustomText(text: 'Palabras Clave (Sinónimos)', fontSize: 15),
                  const SizedBox(height: 5),
                  InputField(
                      label: 'Ingresa palabras clave separadas por comas',
                      controller: widget.titleCtrl // Debería ser otro controller
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Botón final fuera de las tarjetas (o dentro, según prefieras)
              CustomTextButton(onPressed: () {}, text: 'Importar Contenido'),
            ],
          ),
        ),
      ),
    );
  }

  // --- MÉTODO AUXILIAR PARA CREAR LAS TARJETAS GRISES ---
  Widget _buildSectionCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20), // Espacio interno del bloque
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6), // El color gris de fondo exacto de la imagen
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
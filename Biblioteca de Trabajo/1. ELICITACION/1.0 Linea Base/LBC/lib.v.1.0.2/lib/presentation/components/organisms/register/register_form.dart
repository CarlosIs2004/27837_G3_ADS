import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/atoms/custom_button.dart';
import 'package:mingo/presentation/components/atoms/custom_text.dart';
import 'package:mingo/presentation/components/atoms/date_picker_input.dart';
import 'package:mingo/presentation/components/atoms/drop_down_input.dart';
import 'package:mingo/presentation/components/atoms/input_field.dart';

class RegisterForm extends StatefulWidget {

  final TextEditingController nombreCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController dateCtrl;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final VoidCallback onPressed;

  const RegisterForm({super.key, required this.items, this.value, required this.onChanged, required this.onPressed, required this.nombreCtrl, required this.emailCtrl, required this.passCtrl, required this.dateCtrl});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Color.fromRGBO(241,241,241, 1.0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Nombre', fontSize: 15),
              InputField(label: 'Ingrese su nombre', controller: widget.nombreCtrl),
              const SizedBox(height: 10),
              CustomText(text: 'Correo Electrónico', fontSize: 15),
              InputField(label: 'Ingrese su correo electronico', controller: widget.emailCtrl),
              const SizedBox(height: 10),
              CustomText(text: 'Contraseña', fontSize: 15),
              InputField(label: 'Ingrese su contraseña', controller: widget.passCtrl),
              const SizedBox(height: 10),
              CustomText(text: 'Fecha de nacimiento', fontSize: 15),
              DatePickerInput(label: 'dd/mm/aaaa', controller: widget.dateCtrl),
              const SizedBox(height: 10),
              CustomText(text: 'Rol', fontSize: 15),
              DropDownInputCustom(
                label: 'Seleccione su rol',
                items: widget.items,
                onChanged: widget.onChanged,
                value: widget.value,
              ),
              const SizedBox(height: 10),
              Center(
                child: CustomButton(text: 'Registrarse', onPressed: widget.onPressed),
              )
            ],
          ),
        ),
      )
    );
  }
}


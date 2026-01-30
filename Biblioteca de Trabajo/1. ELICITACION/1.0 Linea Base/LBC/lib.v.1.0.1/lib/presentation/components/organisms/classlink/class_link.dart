import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/atoms/custom_button.dart';
import 'package:mingo/presentation/components/atoms/custom_text.dart';
import 'package:mingo/presentation/components/atoms/input_field.dart';

class ClassLink extends StatefulWidget {

  final TextEditingController nombreCtrl;
  final VoidCallback onPressed;

  const ClassLink({super.key, required this.nombreCtrl, required this.onPressed});

  @override
  State<ClassLink> createState() => _ClassLinkState();
}

class _ClassLinkState extends State<ClassLink> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Padding(
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
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50, // tamaño
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                              size: 80,
                            ),
                          ),
                          SizedBox(height: 10,),
                          CustomText(text: 'Bienvenido, Usuario', fontSize: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(1,196,34, 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomText(
                        text: 'Debe llenar el campo con el código de la clase',
                        fontSize: 15,
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241,241,241, 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Código de la Clase', fontSize: 15),
                    SizedBox(height: 10,),
                    InputField(label: 'Ingrese el código del clase', controller: widget.nombreCtrl),
                    const SizedBox(height: 10),
                    Center(
                      child: CustomButton(text: 'Enlazar', onPressed: widget.onPressed),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
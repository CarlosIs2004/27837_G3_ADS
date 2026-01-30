import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/atoms/custom_text.dart';
import 'package:mingo/presentation/components/atoms/custom_text_button.dart';
import 'package:mingo/presentation/screens/screen_register.dart';

class TollBar extends StatefulWidget {

  final String titlePage;
  final bool showBackButton;
  final bool isLogin;
  final bool reverse;

  const TollBar({
    super.key,
    required this.titlePage,
    this.showBackButton = true,
    this.isLogin = false,
    this.reverse = false,
  });

  @override
  State<TollBar> createState() => _TollBarState();
}

class _TollBarState extends State<TollBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(widget.reverse)...[
          CustomText(text: widget.titlePage, fontSize: 18),
          const CustomText(text: 'MinGO', fontSize: 20, color: Color.fromRGBO(8,153,253, 1.0),),
        ],
        if(!widget.reverse)...[
          const CustomText(text: 'MinGO', fontSize: 20, color: Color.fromRGBO(8,153,253, 1.0),),
          CustomText(text: widget.titlePage, fontSize: 18),
        ],
        if(widget.isLogin)
          CustomTextButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ScreenRegister()),
            );
          }, text: 'Registrarse')
      ],
    );
  }
}

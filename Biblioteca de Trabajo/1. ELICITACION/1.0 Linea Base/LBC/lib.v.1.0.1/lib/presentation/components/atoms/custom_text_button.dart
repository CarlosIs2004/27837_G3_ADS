import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {

  final VoidCallback onPressed;
  final String text;

  const CustomTextButton({super.key, required this.onPressed, required this.text});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(8, 153, 253, 0.1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              )
          )
        )
      ),
      child: Text(widget.text,
        style: TextStyle(color: Color.fromRGBO(8, 153, 253, 1.0),),
      ),
    );
  }
}

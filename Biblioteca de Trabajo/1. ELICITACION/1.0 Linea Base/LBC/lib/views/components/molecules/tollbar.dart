import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingo/views/components/atoms/custom_button.dart';
import 'package:mingo/views/components/atoms/custom_text.dart';
import 'package:mingo/views/components/atoms/custom_text_button.dart';

class Tollbar extends StatelessWidget implements PreferredSizeWidget {
  final String titlePage;
  final bool showBackButton;
  final bool isLogin;
  final bool reverse;
  const   Tollbar({
    super.key,
    required this.titlePage,
    this.showBackButton = true,
    this.isLogin = false,
    this.reverse = false,
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: showBackButton,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(reverse)...[
              CustomText(text: titlePage, fontSize: 18),
              const CustomText(text: 'MinGO', fontSize: 20, color: Color.fromRGBO(8,153,253, 1.0),),
            ],
            if(!reverse)...[
              const CustomText(text: 'MinGO', fontSize: 20, color: Color.fromRGBO(8,153,253, 1.0),),
              CustomText(text: titlePage, fontSize: 18),
            ],
            if(isLogin)
              CustomTextButton(onPressed: () => context.go('/register'), text: 'Registrarse')
          ],
        ),

      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
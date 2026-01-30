import 'package:flutter/material.dart';
import 'package:mingo/views/components/molecules/navbar.dart';
import 'package:mingo/views/components/molecules/tollbar.dart';
import 'package:mingo/views/components/organisms/menucard_list.dart';

class MenuclassTemplate extends StatelessWidget {
  final VoidCallback onPrincipianteTap;
  final VoidCallback onIntermedioTap;
  final VoidCallback onAvanzadoTap;
  const MenuclassTemplate({super.key
    , required this.onPrincipianteTap
    , required this.onIntermedioTap
    , required this.onAvanzadoTap
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220,231,251,1.0),
      appBar: Tollbar(titlePage: 'Menú de Clases', reverse: true,),
      body: MenucardList( 
        onPrincipianteTap: onPrincipianteTap,
        onIntermedioTap: onIntermedioTap,
        onAvanzadoTap: onAvanzadoTap,
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
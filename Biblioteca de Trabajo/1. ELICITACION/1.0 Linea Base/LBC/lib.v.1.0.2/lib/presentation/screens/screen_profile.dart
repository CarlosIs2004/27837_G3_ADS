import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/profile/profile_info_card.dart';
import 'package:mingo/presentation/screens/screen_login.dart';
import 'package:provider/provider.dart';
import 'package:mingo/core/services/supa_base_service.dart';
import 'package:mingo/presentation/viewmodels/user_viewmodel.dart';
import 'package:mingo/presentation/templates/profile_template.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos los datos del UserViewModel
    final userVM = context.watch<UserViewModel>();

    return ProfileTemplate(
      body: ProfileInfoCard(
        name: userVM.name,
        email: userVM.email,
        role: userVM.role,
        birthday: userVM.birthday,
        onLogout: () async {
          // Lógica de logout
          await SupaBaseService.client.auth.signOut();
          if (context.mounted) {
            context.read<UserViewModel>().clearUser();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ScreenLogin()),
            );
          }
        },
      ),
    );
  }
}
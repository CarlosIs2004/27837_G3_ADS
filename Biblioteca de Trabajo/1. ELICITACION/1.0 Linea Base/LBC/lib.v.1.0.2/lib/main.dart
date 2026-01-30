import 'package:flutter/material.dart';
import 'package:mingo/core/config/supa_base_config.dart';
import 'package:mingo/data/repository/code_repository.dart';
import 'package:mingo/data/repository/content_repository.dart';
import 'package:mingo/presentation/screens/screen_login.dart';
import 'package:mingo/presentation/viewmodels/code_viewmodel.dart';
import 'package:mingo/presentation/viewmodels/content_advanced_viewmodel.dart';
import 'package:mingo/presentation/viewmodels/content_beginner_viewmodel.dart';
import 'package:mingo/presentation/viewmodels/content_intermediate_viewmodel.dart';
import 'package:mingo/presentation/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {

  await Supabase.initialize(
    url: SupaBaseConfig.url,
    anonKey: SupaBaseConfig.anonKey,
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),
  );

  runApp(const MinGO());
}

class MinGO extends StatefulWidget {
  const MinGO({super.key});

  @override
  State<MinGO> createState() => _MinGOState();
}

class _MinGOState extends State<MinGO> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContentBeginnerViewModel(ContentRepository())),
        ChangeNotifierProvider(create: (_) => ContentIntermediateViewmodel(ContentRepository())),
        ChangeNotifierProvider(create: (_) => ContentAdvancedViewmodel(ContentRepository())),
        ChangeNotifierProvider(create: (_) => UserViewModel(),),
        ChangeNotifierProvider(create: (_) => CodeViewModel(CodeRepository()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0
          )
        ),
        home: const ScreenLogin(),
      )
    );
  }
}


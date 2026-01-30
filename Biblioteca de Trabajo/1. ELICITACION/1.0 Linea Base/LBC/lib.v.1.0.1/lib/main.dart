import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mingo/firebase_options.dart';
import 'package:mingo/viewmodels/login_viewmodel.dart';
import 'package:mingo/viewmodels/register_viewmodel.dart';
import 'package:mingo/views/screens/%20intermediate_view.dart';
import 'package:mingo/views/screens/advanced_view.dart';
import 'package:mingo/views/screens/beginner_view.dart';
import 'package:mingo/views/screens/classlink_view.dart';
import 'package:mingo/views/screens/login_view.dart';
import 'package:mingo/views/screens/menuclass_view.dart';
import 'package:mingo/views/screens/register_view.dart';
import 'package:provider/provider.dart';

void main() async {
  //Inicializamos firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(
          initialLocation: '/login',
          routes: <RouteBase>[
            GoRoute(
              path: '/register',
              builder: (BuildContext context, GoRouterState state) => const RegisterView(),
            ),
            GoRoute(
              path: '/login',
              builder: (BuildContext context, GoRouterState state ) => const LoginView(),
            ),
            GoRoute(
              path : '/classlink',
              builder: ( BuildContext context, GoRouterState state) => const ClasslinkView(),
            ),
            GoRoute(
              path: '/menuclass',
              builder: (BuildContext context, GoRouterState state) => const MenuclassView(),
            ),
            GoRoute(
              path: '/principiante',
              builder: (BuildContext context, GoRouterState state) => const BeginnerView(),
            ),
            GoRoute(
              path: '/intermedio',
              builder: (BuildContext context, GoRouterState state) => const IntermediateView(),
            ),
            GoRoute(path:   '/avanzado',
              builder: (BuildContext context, GoRouterState state) => const AdvancedView(),
            ),
          ],
        ),

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

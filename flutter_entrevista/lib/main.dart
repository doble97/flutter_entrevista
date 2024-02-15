import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_entrevista/src/config/router/app_router.dart';
import 'package:flutter_entrevista/src/config/theme/app_theme.dart';
import 'package:flutter_entrevista/src/presentation/screens/auth/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Entrevista',
      theme: Apptheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}

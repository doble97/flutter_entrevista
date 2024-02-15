import 'package:flutter_entrevista/src/config/router/app_router_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_entrevista/src/presentation/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
      initialLocation: '/',
      refreshListenable: goRouterNotifier,
      routes: [
        GoRoute(
          path: '/',
          name: LoginScreen.name,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/home',
          name: HomeScreen.name,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: ProfileScreen.name,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/offices',
          name: OfficeScreen.name,
          builder: (context, state) => const OfficeScreen(),
        ),
      ],
      redirect: (context, state) {
        final isGoingTo = state.fullPath;
        final authenticated = goRouterNotifier.isAuthenticated;
        if (!authenticated) {
          if (isGoingTo == '/') return null;
          return '/';
        }
        if (authenticated) {
          if (isGoingTo == '/') {
            return '/home';
          }
          return null;
        }
        return null;
      });
});

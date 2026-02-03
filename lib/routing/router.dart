import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/routing/routes.dart';
import 'package:weather_app/ui/home/widgets/home_screen.dart';
import 'package:weather_app/ui/splash/widgets/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {

  return GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          // SplashViewModel(
          //   // Repositories: usaremos o context.read() para buscar a instancia.
          // )
          return SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
    ],
  );
}
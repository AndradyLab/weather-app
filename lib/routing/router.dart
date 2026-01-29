import 'package:go_router/go_router.dart';
import 'package:weather_app/routing/routes.dart';
import 'package:weather_app/ui/home/home_screen.dart';
import 'package:weather_app/ui/splash/widgets/splash_screen.dart';

GoRouter router() => GoRouter(
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

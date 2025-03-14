import 'package:go_router/go_router.dart';
import 'package:masters_flying/src/presentations/home/views/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}

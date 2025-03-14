import 'package:go_router/go_router.dart';

import 'package:masters_flying/src/presentations/flight/views/flight_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/flight_view',
    routes: [
      // GoRoute(
      //   path: '/',

      //   builder: (context, state) => HomeView(),
      // ),
      // GoRoute(
      //   path: '/new_flight',
      //   builder: (context, state) => NewFlightView(),
      // ),
    ],
  );
}

import 'package:go_router/go_router.dart';

import 'package:masters_flying/src/presentations/about_card/views/flight_view.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/new%20_flight_view.dart';
import 'package:masters_flying/src/presentations/home/views/home_view.dart';

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
       GoRoute(
        path: '/flight_view',
        builder: (context, state) => FlightView(),
      ),

    ],
  );
}

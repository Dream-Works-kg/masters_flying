import 'package:flutter/material.dart';
import 'package:masters_flying/src/core/navigator/app_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter.router;
    return ResponsiveSizer(
      builder: (p0, p1, p2) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routerConfig: appRouter,
      ),
    );
  }
}

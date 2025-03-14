import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masters_flying/src/app/app.dart';
import 'package:masters_flying/src/presentations/game/core/flappy_bird_game.dart';
import 'package:masters_flying/src/presentations/game/screens/game_over_screen.dart';
import 'package:masters_flying/src/presentations/home/home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  runApp(
    App()
  );
}

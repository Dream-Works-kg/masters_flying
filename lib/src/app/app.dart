import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:masters_flying/src/presentations/game/core/flappy_bird_game.dart';
import 'package:masters_flying/src/presentations/game/screens/game_over_screen.dart';
import 'package:masters_flying/src/presentations/home/views/home_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final game = FlappyBirdGame();
    return ResponsiveSizer(
      builder: (p0, p1, p2) => GameWidget(
        game: game,
        initialActiveOverlays: const [HomeView.id],
        overlayBuilderMap: {
          'mainMenu': (context, _) => HomeView(game: game),
          'gameOver': (context, _) => GameOverScreen(game: game),
        },
      ),
    );
  }
}

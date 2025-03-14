import 'package:flutter/material.dart';
import 'package:masters_flying/src/presentations/game/core/flappy_bird_game.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black54,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                '${game.bird.score}',
                style: TextStyle(
                  fontSize: 50.sp,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              Text(
                'Score',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF7383BC),
                  fontSize: 25.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15.h),
              _buildButton(
                'RESET',
                Colors.white,
                Colors.white,
                () {
                  game.bird.reset();
                  game.overlays.remove('gameOver');
                  game.resumeEngine();
                },
              ),
              SizedBox(height: 2.h),
              _buildButton(
                'MENU',
                Colors.white,
                Colors.white,
                () {
                  game.overlays.remove('gameOver');
                  game.overlays.add('mainMenu');
                },
              ),
            ],
          ),
        ),
      );

  Widget _buildButton(
      String text, Color borderColor, Color textColor, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 7.h,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

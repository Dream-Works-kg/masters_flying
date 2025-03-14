import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masters_flying/src/core/core.dart';
import 'package:masters_flying/src/presentations/game/core/flappy_bird_game.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';
  const HomeView({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return CustomScaffold(
      body: Stack(
        children: [
          Positioned(
            top: 5.h,
            child: Image.asset(
              'assets/images/map.png',
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 20.sp,
            top: 5.h,
            child: SvgPicture.asset(
              'assets/svg/star_icon.svg',
              width: 22.sp,
            ),
          ),
          Positioned(
            top: 8.5.h,
            left: 5.w,
            child: Image.asset(
              'assets/images/logo.png',
              width: 90.w,
            ),
          ),
          Positioned(
            top: 31.h,
            left: 0,
            right: 0,
            child: Container(
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff0C0E58),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [],
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '4',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Total flights',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Color(0xFF7383BC),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  _buildButton(
                    'Start',
                    const Color(0xFF070730),
                    () {},
                  ),
                  SizedBox(height: 2.h),
                  _buildButton(
                    'Tired of waiting for your flight?',
                    const Color(0xFF324BA1),
                    () {
                      game.overlays.remove('mainMenu');
                      game.resumeEngine();
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 26.h,
            left: 39.w,
            child: Image.asset(
              'assets/images/plane.png',
              width: 25.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 8.h,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(126.17),
          ),
          shadows: [
            const BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 12.31,
              offset: Offset(0, 12.31),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

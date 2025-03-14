import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlightHeader extends StatelessWidget {
  const FlightHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),
        Stack(
          children: [
            Image.asset('assets/images/av.png'),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 19.sp,
                vertical: 29.sp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  Text(
                    "Flight Details",
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/images/star.png',
                    height: 3.5.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masters_flying/src/presentations/all_favorite_flights/all_favorite_flights.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070730),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 27.sp, horizontal: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'All Flights',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svg/pencil.svg',
                    height: 4.h,
                    width: 4.w,
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/Group 121.png', width: 60.w),
            SizedBox(height: 5.5.h),
            Container(
              height: 70.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff0C0E58),
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                  vertical: 18.sp,
                ),
                child: Column(
                  children: [
                    CustomContainerFly(
                      departureCode: 'GUJ',
                      departureCity: 'Gujarat',
                      arrivalCode: 'MUM',
                      arrivalCity: 'Mumbai',
                      leftIconPath: 'assets/svg/Vector (2).svg',
                      departureTime: '09:30 AM',
                      arrivalTime: '11:45 AM',
                      duration: '1h 20m',
                      departureDate: 'Mon 15 Jul',
                      arrivalDate: 'Mon 15 Jul',
                      price: '\$20',
                      planeImagePath: 'assets/images/Group 123.png',
                      alternateLeftIconPath: 'assets/svg/Vector.svg',
                    ),
                    SizedBox(height: 2.5.h),
                    CustomContainerFly(
                      departureCode: 'GUJ',
                      departureCity: 'Gujarat',
                      arrivalCode: 'MUM',
                      arrivalCity: 'Mumbai',
                      leftIconPath: 'assets/svg/Vector (2).svg',
                      departureTime: '09:30 AM',
                      arrivalTime: '11:45 AM',
                      duration: '1h 20m',
                      departureDate: 'Mon 15 Jul',
                      arrivalDate: 'Mon 15 Jul',
                      price: '\$20',
                      planeImagePath: 'assets/images/Group 123.png',
                      alternateLeftIconPath: 'assets/svg/Vector.svg',
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      height: 7.5.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff070730),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          'Create New',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

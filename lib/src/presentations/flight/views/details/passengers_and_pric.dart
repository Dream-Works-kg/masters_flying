import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PassengersAndPrice extends StatelessWidget {
  const PassengersAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff324BA1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(45),
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Passengers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 28.8.w,
                  height: 8.h,
                  decoration: ShapeDecoration(
                    color: Color(0x33B7B7B7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(126.17),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 28.8.w,
                  height: 8.h,
                  decoration: ShapeDecoration(
                    color: Color(0x33B7B7B7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(126.17),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "20\$",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

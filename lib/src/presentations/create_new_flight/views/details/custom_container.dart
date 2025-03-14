import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomContainer extends StatelessWidget {
  final String label;
  final String hintText;
  final String imagePath;

  const CustomContainer({
    super.key,
    required this.label,
    required this.hintText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.sp),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          height: 6.5.h,
          width: 90.w,
          decoration: BoxDecoration(
            color: Color(0x33B7B7B7),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [],
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.sp,
                vertical: 14.5.sp,
              ),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.sp, right: 10.sp),
                child: Image.asset(
                  imagePath,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.5.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

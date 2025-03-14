import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PriceContainer extends StatefulWidget {
  final String label;

  const PriceContainer({
    super.key,
    required this.label,
  });

  @override
  State<PriceContainer> createState() => _PriceContainerState();
}

class _PriceContainerState extends State<PriceContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.sp),
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 1.h),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 6.7.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: const Color(0x33B7B7B7),
              borderRadius: BorderRadius.circular(50),
               boxShadow: [
                      BoxShadow(
                         color: Color(0x33B7B7B7),
                        offset: Offset(
                            2, 2), 
                        blurRadius: 4, 
                      ),
                    ],
            ),
            child: TextField(
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.5.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 15.sp,
                  left: 20.sp,
                ),
                border: InputBorder.none,
                isDense: true,
                hintText: 'Введите цену',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

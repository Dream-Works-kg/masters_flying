
import 'package:flutter/material.dart';
import 'package:masters_flying/src/core/core.dart';
import 'package:masters_flying/src/presentations/create_new_flight/widget/all_text_field_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewFlightView extends StatelessWidget {
  const NewFlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.6.h),
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
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.sp,
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
          ),
          Positioned(
            top: 45.sp,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff0C0E58),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(38.sp),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AllTextFieldWidgets(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlightInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          'Mon 15 Jul',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              'GUJ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset("assets/images/fly.png", height: 6.5.h),
                            Text(
                              textAlign: TextAlign.start,
                              'MUM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              'Gujarat',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              '1h 20m',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              'Mumbai',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
    );
  }
}

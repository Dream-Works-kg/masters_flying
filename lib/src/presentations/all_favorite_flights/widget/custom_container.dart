import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomContainerFly extends StatefulWidget {
  final String departureCode;
  final String departureCity;
  final String arrivalCode;
  final String arrivalCity;
  final String leftIconPath;
  final String alternateLeftIconPath;

  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String departureDate;
  final String arrivalDate;
  final String price;
  final String planeImagePath;
  final Color backgroundColor;

  const CustomContainerFly({
    super.key,
    required this.departureCode,
    required this.departureCity,
    required this.arrivalCode,
    required this.arrivalCity,
    required this.leftIconPath,
    required this.alternateLeftIconPath,

    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.departureDate,
    required this.arrivalDate,
    required this.price,
    required this.planeImagePath,
    this.backgroundColor = const Color(0xff324BA1),
  });

  @override
  _CustomFlightCardState createState() => _CustomFlightCardState();
}

class _CustomFlightCardState extends State<CustomContainerFly> {
  late String currentLeftIcon;

  @override
  void initState() {
    super.initState();
    currentLeftIcon = widget.leftIconPath;
  }

  void _toggleLeftIcon() {
    setState(() {
      currentLeftIcon =
          (currentLeftIcon == widget.leftIconPath)
              ? widget.alternateLeftIconPath
              : widget.leftIconPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 9),
            blurRadius: 9,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 13.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _toggleLeftIcon,
                      child: SvgPicture.asset(
                        currentLeftIcon,
                        height: 3.5.h,
                        width: 3.5.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.departureCode, style: _textStyle(16)),
                              Text(widget.departureCity, style: _textStyle(13)),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.arrivalCode, style: _textStyle(16)),
                              Text(widget.arrivalCity, style: _textStyle(13)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 3.5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Depart', style: _textStyle(13, Colors.white70)),
                          Text(
                            widget.duration,
                            style: _textStyle(14, Colors.white70),
                          ),
                          Text('Arrive', style: _textStyle(13, Colors.white70)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(widget.departureDate, style: _textStyle(14)),
                          const Spacer(),
                          Text(widget.arrivalDate, style: _textStyle(14)),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Text('Price', style: _textStyle(14, Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 35.5.sp,
            left: 16.sp,
            right: 16.sp,
            child: Image.asset(widget.planeImagePath),
          ),
          Positioned(
            top: 47.7.sp,
            left: 16.sp,
            right: 16.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.departureTime, style: _textStyle(16)),
                Text(
                  widget.price,
                  style: _textStyle(22, Colors.white, FontWeight.bold),
                ),
                Text(widget.arrivalTime, style: _textStyle(16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(
    double size, [
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w600,
  ]) {
    return GoogleFonts.inter(
      color: color,
      fontSize: size.sp,
      fontWeight: fontWeight,
    );
  }
}

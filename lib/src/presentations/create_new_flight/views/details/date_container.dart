import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DateContainer extends StatefulWidget {
  final String label;
  final String imagePath;
  final String dateText;

  const DateContainer({
    super.key,
    required this.label,
    required this.imagePath,
    required this.dateText,
  });

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    if (widget.dateText.trim().isEmpty) {
      _selectedDateTime = DateTime.now();
    } else {
      try {
        _selectedDateTime = DateFormat('d MMMM hh:mm a').parse(widget.dateText);
      } catch (e) {
        _selectedDateTime = DateTime.now();
      }
    }
  }

  void _showDateTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.black,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: _selectedDateTime,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                _selectedDateTime = newDateTime;
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateText = DateFormat('d MMMM hh:mm a').format(_selectedDateTime);

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
          onTap: _showDateTimePicker,
          child: Container(
            height: 6.7.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: const Color(0x33B7B7B7),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.sp),
                  child: Image.asset(
                    widget.imagePath,
                    height: 22.5.sp,
                    width: 22.5.sp,
                  ),
                ),
                Text(
                  dateText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

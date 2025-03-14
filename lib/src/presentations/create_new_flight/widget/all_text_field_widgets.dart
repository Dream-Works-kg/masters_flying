import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/details/custom_container.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/details/date_container.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/details/price_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllTextFieldWidgets extends StatefulWidget {
  const AllTextFieldWidgets({super.key});

  @override
  State<AllTextFieldWidgets> createState() => _AllTextFieldWidgetsState();
}

class _AllTextFieldWidgetsState extends State<AllTextFieldWidgets> {
  File? _selectedImage; // Хранит выбранное изображение

  // Функция выбора изображения
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.5.h),
          CustomContainer(
            label: 'From',
            hintText: 'Enter Flight Number',
            imagePath: 'assets/images/plane.png',
          ),
          SizedBox(height: 1.2.h),
          CustomContainer(
            label: 'To',
            hintText: 'Enter Flight Number',
            imagePath: 'assets/images/plane1.png',
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.sp),
            child: Row(
              children: [
                DateContainer(
                  label: 'Depart',
                  dateText: '',
                  imagePath: 'assets/images/Calender.png',
                ),
                SizedBox(width: 13.sp),
                DateContainer(
                  label: 'Arrive',
                  dateText: '',
                  imagePath: 'assets/images/Calender.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              PriceContainer(
                label: 'Passengers',
              ),
              SizedBox(width: 14.sp),
              PriceContainer(
                label: 'Price',
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: Text(
              'Add a photo of the ticket',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          GestureDetector(
            onTap: _pickImage, // Открываем галерею при нажатии
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: const Color(0x33B7B7B7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            _selectedImage!,
                            width: double.infinity,
                            height: 18.h,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 45.sp,
                        ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            height: 8.5.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff070730),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

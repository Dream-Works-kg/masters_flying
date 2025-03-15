import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masters_flying/src/models/flight_ticket_model.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/details/custom_container.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/details/date_container.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/details/price_container.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllTextFieldWidgets extends StatefulWidget {
  const AllTextFieldWidgets({super.key});

  @override
  State<AllTextFieldWidgets> createState() => _AllTextFieldWidgetsState();
}

class _AllTextFieldWidgetsState extends State<AllTextFieldWidgets> {
  final controllerFrom = TextEditingController();
  final controllerTo = TextEditingController();

  final controllerPassengers = TextEditingController();
  final controllerPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlightTicketProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.5.h),
          CustomContainer(
            controller: controllerFrom,
            onChanged: provider.updateFrom,
            label: 'From',
            hintText: 'Enter Flight Number',
            imagePath: 'assets/images/plane.png',
          ),
          SizedBox(height: 1.2.h),
          CustomContainer(
            controller: controllerTo,
            onChanged: provider.updateTo,
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
                  onDateSelected: provider.updateDepartureTime,
                ),
                SizedBox(width: 13.sp),
                DateContainer(
                  label: 'Arrive',
                  dateText: '',
                  onDateSelected: provider.updateArrivalTime,
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              PriceContainer(
                controller: controllerPassengers,
                hintext: 'passengers',
                label: 'Passengers',
                onChanged: (value) =>
                    provider.updatePassengers(int.tryParse(value) ?? 1),
              ),
              SizedBox(width: 14.sp),
              PriceContainer(
                controller: controllerPrice,
                hintext: 'price',
                label: 'Price',
                onChanged: (value) =>
                    provider.updatePrice(int.tryParse(value) ?? 0),
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
            onTap: () async {
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                provider.updateTicketPhoto(File(pickedFile.path));
              }
            },
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: const Color(0x33B7B7B7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: provider.currentTicket.ticketPhoto != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            provider.currentTicket.ticketPhoto!,
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
        ],
      ),
    );
  }
}

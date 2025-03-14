import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masters_flying/src/core/core.dart';
import 'package:masters_flying/src/models/flight_ticket_model.dart';
import 'package:masters_flying/src/presentations/create_new_flight/widget/all_text_field_widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateNewFlightView extends StatelessWidget {
  const CreateNewFlightView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlightTicketProvider>(context);
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
                          "New Flight",
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.toggleFavoriteM(provider.currentTicket.id);
                          },
                          child: Consumer<FlightTicketProvider>(
                            builder: (context, provider, child) {
                              final isFavorite =
                                  provider.currentTicket.isFavorite;
                              return SvgPicture.asset(
                                isFavorite
                                    ? 'assets/svg/Vector.svg'
                                    : 'assets/svg/Vector (2).svg',
                                height: 3.5.h,
                                width: 3.5.w,
                              );
                            },
                          ),
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
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () {
                        provider.saveTicket();
                        Navigator.pop(context);
                      },
                      child: Container(
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
                    ),
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

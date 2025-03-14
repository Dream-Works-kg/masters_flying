import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masters_flying/src/models/flight_ticket_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlightHeader extends StatelessWidget {
  const FlightHeader({
    super.key,
    required this.ticket,
  });
  final FlightTicket ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),
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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  Text(
                    "Flight Details",
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<FlightTicketProvider>(context, listen: false)
                          .toggleFavorite(ticket.id);
                    },
                    child: SvgPicture.asset(
                      Provider.of<FlightTicketProvider>(context)
                              .tickets
                              .firstWhere((ticket) => ticket.id == ticket.id)
                              .isFavorite
                          ? 'assets/svg/Vector.svg'
                          : 'assets/svg/Vector (2).svg',
                      height: 3.5.h,
                      width: 3.5.w,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

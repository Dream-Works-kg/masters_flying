import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masters_flying/src/models/flight_ticket_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlightInfo extends StatelessWidget {
  final FlightTicket ticket;
  const FlightInfo({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlightTicketProvider>(context);

    Duration flightDuration =
        ticket.arrivalTime.difference(ticket.departureTime);

    String durationText =
        "${flightDuration.inHours}h ${flightDuration.inMinutes.remainder(60)}m";

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            DateFormat('EEE d MMM ').format(ticket.departureTime),
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
                provider.getCityCode(ticket.from),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset("assets/images/fly.png", height: 5.h),
              Text(
                textAlign: TextAlign.start,
                provider.getCityCode(ticket.to),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp,
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
                ticket.from,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                textAlign: TextAlign.start,
                durationText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                textAlign: TextAlign.start,
                ticket.to,
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

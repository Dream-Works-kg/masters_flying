import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:masters_flying/src/models/flight_ticket_model.dart';
import 'package:masters_flying/src/presentations/create_new_flight/views/create_new_flight.dart';
import 'package:masters_flying/src/presentations/presentations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllFlightsView extends StatefulWidget {
  const AllFlightsView({super.key});

  @override
  State<AllFlightsView> createState() => _AllFlightsViewState();
}

class _AllFlightsViewState extends State<AllFlightsView> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FlightTicketProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff070730),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 27.sp, horizontal: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'All Flights',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEdit = !isEdit;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/svg/pencil.svg',
                      height: 4.h,
                      width: 4.w,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/Group 121.png', width: 60.w),
            SizedBox(height: 5.5.h),
            Container(
              height: 70.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff0C0E58),
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.sp,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 0,
                    child: ListView.builder(
                      itemCount: provider.tickets.length,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      itemBuilder: (context, index) {
                        final ticket = provider.tickets[index];
                        Duration flightDuration =
                            ticket.arrivalTime.difference(ticket.departureTime);

                        String durationText =
                            "${flightDuration.inHours}h ${flightDuration.inMinutes.remainder(60)}m";
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FlightView(
                                        ticket: ticket,
                                      ),
                                    ));
                              },
                              child: CustomFlightCard(
                                tiketId: ticket.id,
                                isEdit: isEdit,
                                departureCode:
                                    provider.getCityCode(ticket.from),
                                departureCity: ticket.from,
                                arrivalCode: provider.getCityCode(ticket.to),
                                arrivalCity: ticket.to,
                                departureTime: DateFormat('hh:mm a')
                                    .format(ticket.departureTime),
                                arrivalTime: DateFormat('hh:mm a')
                                    .format(ticket.arrivalTime),
                                duration: durationText,
                                departureDate: DateFormat('EEE d MMM ')
                                    .format(ticket.departureTime),
                                arrivalDate: DateFormat('EEE d MMM ')
                                    .format(ticket.arrivalTime),
                                price: '\$${ticket.price}',
                                planeImagePath: 'assets/images/Group 123.png',
                                alternateLeftIconPath: 'assets/svg/Vector.svg',
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 3.h,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateNewFlightView(),
                          ),
                        );
                      },
                      child: Container(
                        height: 7.5.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff070730),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            'Create New',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

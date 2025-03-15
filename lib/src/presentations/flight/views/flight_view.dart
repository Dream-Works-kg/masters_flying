import 'package:flutter/material.dart';
import 'package:masters_flying/src/core/core.dart';
import 'package:masters_flying/src/models/flight_ticket_model.dart';
import 'package:masters_flying/src/presentations/flight/about_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlightView extends StatefulWidget {
  final FlightTicket ticket;

  const FlightView({
    super.key,
    required this.ticket,
  });

  @override
  State<FlightView> createState() => _FlightViewState();
}

class _FlightViewState extends State<FlightView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          FlightHeader(
            ticket: widget.ticket,
          ),
          Positioned(
            top: 45.sp,
            left: 15.sp,
            right: 15.sp,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff324BA1),
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.5.h),
                    FlightInfo(
                      ticket: widget.ticket,
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      height: 66.5.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF070730),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 13.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.sp),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 21.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0x33B7B7B7),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: widget.ticket.ticketPhoto != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.file(
                                            widget.ticket.ticketPhoto!,
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
                          SizedBox(height: 13.h),
                          PassengersAndPrice(
                            ticket: widget.ticket,
                          ),
                        ],
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

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:masters_flying/src/core/core.dart';
// import 'package:masters_flying/src/models/flight_ticket_model.dart';
// import 'package:masters_flying/src/presentations/flight/about_card.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class FlightView extends StatefulWidget {
//   final FlightTicket ticket;

//   const FlightView({super.key, required this.ticket});

//   @override
//   State<FlightView> createState() => _FlightViewState();
// }

// class _FlightViewState extends State<FlightView> {
//   File? _selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       body: Stack(
//         children: [
//           // Заголовок рейса (можно добавить дополнительные данные)
//           FlightHeader(),
//           Positioned(
//             top: 45.sp,
//             left: 15.sp,
//             right: 15.sp,
//             bottom: 0,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 2.w),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xff324BA1),
//                   borderRadius: BorderRadius.circular(35),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 6,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 2.5.h),

//                     // Информация о рейсе
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15.sp),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "${widget.ticket.from} → ${widget.ticket.to}",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 1.h),
//                           Text(
//                             "Departure: ${DateFormat('hh:mm a, EEE d MMM').format(widget.ticket.departureTime)}",
//                             style: TextStyle(
//                                 color: Colors.white70, fontSize: 16.sp),
//                           ),
//                           Text(
//                             "Arrival: ${DateFormat('hh:mm a, EEE d MMM').format(widget.ticket.arrivalTime)}",
//                             style: TextStyle(
//                                 color: Colors.white70, fontSize: 16.sp),
//                           ),
//                           SizedBox(height: 1.h),
//                           Text(
//                             "Passengers: ${widget.ticket.passengers}",
//                             style: TextStyle(
//                                 color: Colors.white70, fontSize: 16.sp),
//                           ),
//                           Text(
//                             "Price: \$${widget.ticket.price.toStringAsFixed(2)}",
//                             style: TextStyle(
//                                 color: Colors.white70, fontSize: 16.sp),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 3.h),

//                     // Нижний контейнер
//                     Container(
//                       height: 66.5.h,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF070730),
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(45),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           SizedBox(height: 13.h),

//                           // Фото билета
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 15.sp),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   width: double.infinity,
//                                   height: 21.h,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0x33B7B7B7),
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: widget.ticket.ticketPhoto != null
//                                       ? ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(30),
//                                           child: Image.file(
//                                             widget.ticket.ticketPhoto!,
//                                             width: double.infinity,
//                                             height: 18.h,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         )
//                                       : Icon(
//                                           Icons.add_circle_outline,
//                                           color: Colors.white,
//                                           size: 45.sp,
//                                         ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 13.h),

//                           // Информация о пассажирах и цене
//                           PassengersAndPrice(
//                             ticket: widget.ticket,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

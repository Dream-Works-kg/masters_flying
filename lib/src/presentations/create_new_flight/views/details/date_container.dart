import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DateContainer extends StatefulWidget {
  final String label;
  final String dateText;

  final Function(DateTime) onDateSelected;

  const DateContainer({
    super.key,
    required this.label,
    required this.dateText,
    required this.onDateSelected,
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
        _selectedDateTime =
            DateFormat('EEE d MMM hh:mm a').parse(widget.dateText);
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
          height: 30.h,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: _selectedDateTime,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() => _selectedDateTime = newDateTime);
              widget.onDateSelected(newDateTime);
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
                    'assets/images/Calender.png',
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


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class FlightTicket {
//   String from;
//   String to;
//   DateTime departureTime;
//   DateTime arrivalTime;
//   int passengers;
//   double price;
//   File? ticketPhoto;

//   FlightTicket({
//     required this.from,
//     required this.to,
//     required this.departureTime,
//     required this.arrivalTime,
//     required this.passengers,
//     required this.price,
//     this.ticketPhoto,
//   });
// }

// class FlightTicketProvider with ChangeNotifier {
//   FlightTicket _ticket = FlightTicket(
//     from: '',
//     to: '',
//     departureTime: DateTime.now(),
//     arrivalTime: DateTime.now(),
//     passengers: 1,
//     price: 0.0,
//   );

//   FlightTicket get ticket => _ticket;

//   void updateFrom(String value) {
//     _ticket.from = value;
//     notifyListeners();
//   }

//   void updateTo(String value) {
//     _ticket.to = value;
//     notifyListeners();
//   }

//   void updateDepartureTime(DateTime date) {
//     _ticket.departureTime = date;
//     notifyListeners();
//   }

//   void updateArrivalTime(DateTime date) {
//     _ticket.arrivalTime = date;
//     notifyListeners();
//   }

//   void updatePassengers(int value) {
//     _ticket.passengers = value;
//     notifyListeners();
//   }

//   void updatePrice(double value) {
//     _ticket.price = value;
//     notifyListeners();
//   }

//   void updateTicketPhoto(File? image) {
//     _ticket.ticketPhoto = image;
//     notifyListeners();
//   }
// }

// class AllTextFieldWidgets extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FlightTicketProvider>(context);
    
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12.sp),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 1.5.h),
//           TextField(
//             onChanged: provider.updateFrom,
//             decoration: InputDecoration(labelText: 'From'),
//           ),
//           SizedBox(height: 1.2.h),
//           TextField(
//             onChanged: provider.updateTo,
//             decoration: InputDecoration(labelText: 'To'),
//           ),
//           SizedBox(height: 2.h),
//           Row(
//             children: [
//               _DateContainer(label: 'Depart', onDateSelected: provider.updateDepartureTime),
//               SizedBox(width: 13.sp),
//               _DateContainer(label: 'Arrive', onDateSelected: provider.updateArrivalTime),
//             ],
//           ),
//           SizedBox(height: 2.h),
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   onChanged: (value) => provider.updatePassengers(int.tryParse(value) ?? 1),
//                   decoration: InputDecoration(labelText: 'Passengers'),
//                 ),
//               ),
//               SizedBox(width: 14.sp),
//               Expanded(
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   onChanged: (value) => provider.updatePrice(double.tryParse(value) ?? 0.0),
//                   decoration: InputDecoration(labelText: 'Price'),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 2.h),
//           GestureDetector(
//             onTap: () async {
//               final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//               if (pickedFile != null) {
//                 provider.updateTicketPhoto(File(pickedFile.path));
//               }
//             },
//             child: Container(
//               width: double.infinity,
//               height: 18.h,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: provider.ticket.ticketPhoto != null
//                   ? Image.file(provider.ticket.ticketPhoto!, fit: BoxFit.cover)
//                   : Icon(Icons.add_a_photo, size: 45.sp),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           ElevatedButton(
//             onPressed: () {
//               print("Saved Flight: ${provider.ticket.from} to ${provider.ticket.to}");
//             },
//             child: Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _DateContainer extends StatefulWidget {
//   final String label;
//   final Function(DateTime) onDateSelected;

//   const _DateContainer({required this.label, required this.onDateSelected});

//   @override
//   State<_DateContainer> createState() => _DateContainerState();
// }

// class _DateContainerState extends State<_DateContainer> {
//   late DateTime _selectedDateTime;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDateTime = DateTime.now();
//   }

//   void _showDateTimePicker() {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 30.h,
//           color: Colors.white,
//           child: CupertinoDatePicker(
//             mode: CupertinoDatePickerMode.dateAndTime,
//             initialDateTime: _selectedDateTime,
//             onDateTimeChanged: (DateTime newDateTime) {
//               setState(() => _selectedDateTime = newDateTime);
//               widget.onDateSelected(newDateTime);
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _showDateTimePicker,
//       child: Container(
//         padding: EdgeInsets.all(10.sp),
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Text(
//           DateFormat('d MMM yyyy, hh:mm a').format(_selectedDateTime),
//           style: TextStyle(fontSize: 14.sp),
//         ),
//       ),
//     );
//   }
// }

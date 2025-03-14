import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

class FlightTicket {
  bool isFavorite;
  int id;
  String from;
  String to;
  DateTime departureTime;
  DateTime arrivalTime;
  int passengers;
  int price;
  File? ticketPhoto;

  FlightTicket({
    this.isFavorite = false, // По умолчанию не избранный
    required this.id,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.passengers,
    required this.price,
    this.ticketPhoto,
  });
}

class FlightTicketProvider with ChangeNotifier {
  void removeTicket(int id) {
    _tickets.removeWhere((ticket) => ticket.id == id);
    notifyListeners();
  }

  void toggleFavorite(int id) {
    final ticket = _tickets.firstWhere((ticket) => ticket.id == id);
    ticket.isFavorite = !ticket.isFavorite;
    notifyListeners();
  }

  final List<FlightTicket> _tickets = [];
  int _currentId = 0;

  List<FlightTicket> get tickets => _tickets;

  FlightTicket _currentTicket = FlightTicket(
    id: 0,
    from: '',
    to: '',
    departureTime: DateTime.now(),
    arrivalTime: DateTime.now(),
    passengers: 1,
    price: 0,
  );

  FlightTicket get currentTicket => _currentTicket;

  void updateFrom(String value) {
    _currentTicket.from = value;
    notifyListeners();
  }

  void updateTo(String value) {
    _currentTicket.to = value;
    notifyListeners();
  }

  void updateDepartureTime(DateTime date) {
    _currentTicket.departureTime = date;
    notifyListeners();
  }

  void updateArrivalTime(DateTime date) {
    _currentTicket.arrivalTime = date;
    notifyListeners();
  }

  void updatePassengers(int value) {
    _currentTicket.passengers = value;
    notifyListeners();
  }

  void updatePrice(int value) {
    _currentTicket.price = value;
    notifyListeners();
  }

  String getCityCode(String city) {
    return city.length >= 3
        ? city.substring(0, 3).toUpperCase()
        : city.toUpperCase();
  }

  void updateTicketPhoto(File? image) {
    _currentTicket.ticketPhoto = image;
    notifyListeners();
  }

  void saveTicket() {
    _currentTicket.id = ++_currentId;
    _tickets.add(_currentTicket);
    _currentTicket = FlightTicket(
      id: 0,
      from: '',
      to: '',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now(),
      passengers: 1,
      price: 0,
    );
    notifyListeners();
    log("Flight saved: ${_tickets.last.from} -> ${_tickets.last.to}, ${_tickets.last.passengers} passengers, \$${_tickets.last.price}");
  }
}

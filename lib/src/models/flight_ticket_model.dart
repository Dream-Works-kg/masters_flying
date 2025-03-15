import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

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
    this.isFavorite = false,
    required this.id,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.passengers,
    required this.price,
    this.ticketPhoto,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'isFavorite': isFavorite,
        'from': from,
        'to': to,
        'departureTime': departureTime.toIso8601String(),
        'arrivalTime': arrivalTime.toIso8601String(),
        'passengers': passengers,
        'price': price,
        'ticketPhoto': ticketPhoto?.path,
      };

  factory FlightTicket.fromJson(Map<String, dynamic> json) {
    File? photoFile;
    if (json['ticketPhoto'] != null) {
      File tempFile = File(json['ticketPhoto']);
      if (tempFile.existsSync()) {
        photoFile = tempFile;
      }
    }

    return FlightTicket(
      id: json['id'],
      isFavorite: json['isFavorite'],
      from: json['from'],
      to: json['to'],
      departureTime: DateTime.parse(json['departureTime']),
      arrivalTime: DateTime.parse(json['arrivalTime']),
      passengers: json['passengers'],
      price: json['price'],
      ticketPhoto: photoFile,
    );
  }
}

class FlightTicketProvider with ChangeNotifier {
  final List<FlightTicket> _tickets = [];
  int _currentId = 0;
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
  List<FlightTicket> get tickets => _tickets;

  FlightTicketProvider() {
    _loadTickets();
  }

  void _loadTickets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('tickets');
    if (data != null) {
      List<dynamic> jsonList = jsonDecode(data);
      _tickets.clear();
      _tickets.addAll(jsonList.map((e) => FlightTicket.fromJson(e)));
      _currentId = _tickets.isNotEmpty ? _tickets.last.id : 0;
    }
    notifyListeners();
  }

  void _saveTickets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList =
        _tickets.map((e) => e.toJson()).toList();
    await prefs.setString('tickets', jsonEncode(jsonList));
  }

  void updateTicketPhoto(File? image) async {
    if (image != null && image.existsSync()) {
      File savedImage = await saveImageToPermanentStorage(image);
      _currentTicket.ticketPhoto = savedImage;
      _saveTickets();
    } else {
      _currentTicket.ticketPhoto = null;
    }
    notifyListeners();
  }

  void saveTicket() {
    File? savedPhoto =
        _currentTicket.ticketPhoto; // Сохраняем текущее фото перед сбросом

    _currentTicket.id = ++_currentId;
    _tickets.add(_currentTicket);
    _saveTickets();

    _currentTicket = FlightTicket(
      id: 0,
      from: '',
      to: '',
      departureTime: DateTime.now(),
      arrivalTime: DateTime.now(),
      passengers: 1,
      price: 0,
      ticketPhoto: savedPhoto,
    );

    notifyListeners();
  }

  final bool _isFavorite = false;
  int _totalFlights = 0;

  int get totalFlights => _totalFlights;

  Future<File> saveImageToPermanentStorage(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final newPath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    File newFile = await image.copy(newPath);
    return newFile;
  }

  void addFlight() {
    _totalFlights++;
    _saveTickets();
    notifyListeners();
  }

  void resetFlights() {
    _totalFlights = 0;
    _saveTickets();
    notifyListeners();
  }

  void removeTicket(int id) {
    _tickets.removeWhere((ticket) => ticket.id == id);
    _saveTickets();
    notifyListeners();
  }

  void toggleFavorite(int id) {
    final ticket = _tickets.firstWhere((ticket) => ticket.id == id);
    ticket.isFavorite = !ticket.isFavorite;
    _saveTickets();
    notifyListeners();
  }

  void toggleFavoriteM(int id) {
    if (_currentTicket.id == 0) {
      _currentTicket.isFavorite = !_currentTicket.isFavorite;
    } else {
      final ticket = _tickets.firstWhere((ticket) => ticket.id == id);
      ticket.isFavorite = !ticket.isFavorite;
    }
    _saveTickets();
    notifyListeners();
  }

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
}

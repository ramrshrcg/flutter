import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid = Uuid();
final formatter= DateFormat.yMd();
enum Category{food, travel, work, leisure,miscelneous}   

// ignore: constant_identifier_names
const CategoryIcons={
  Category.food: Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.miscelneous: Icons.miscellaneous_services,
   
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }):id=uuid.v4()   ;

  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category ; 

  String get formattedDate {
    return formatter.format(date);
  }
}

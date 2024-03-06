// ignore_for_file: unused_import, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spotquick/models/booked.dart';

ValueNotifier<List<Booked>>BookedList=ValueNotifier([]);
String cardetail='booked';

class bookedFunc{
  Future<void>getAllBooked()async{
    final bookedslot=await Hive.openBox<Booked>(cardetail);
    BookedList.value.clear();
    BookedList.value.addAll(bookedslot.values);
    BookedList.notifyListeners();
  }
Future<void> deleteslots(context, int id) async {
  final box = await Hive.openBox<Booked>('booked'); 
  print(id);
  await box.delete(id);
  getAllBooked();
}
}
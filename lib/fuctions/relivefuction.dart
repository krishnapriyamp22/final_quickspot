// ignore_for_file: unused_import, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spotquick/models/relive.dart';


ValueNotifier<List<Relive>> relivelist = ValueNotifier([]);
String relives = 'relive';

class ReliveFunction {
  Future<void> reliveSave(Relive value) async {
    final save = await Hive.openBox<Relive>(relives);
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(id, Relive(slotnumber: data!.slotnumber, id: id));
    getAllRelive();
  }

  Future<void> getAllRelive() async {
    final save = await Hive.openBox<Relive>(relives);
    relivelist.value.clear();
    relivelist.value.addAll(save.values);
    relivelist.notifyListeners();
  }
}

//   Future<void> deleteReliveBySlotNumber(int slotNumber) async {
//     final save = await Hive.openBox<Relive>(relives);
//     final reliveToDelete = save.values.firstWhere(
//       (relive) => relive.slotnumber == slotNumber,
//       orElse: () => null!,
//     );

//     if (reliveToDelete != null) {
//       await save.delete(reliveToDelete.id);
//       getAllRelive();
//     }
//   }
// }

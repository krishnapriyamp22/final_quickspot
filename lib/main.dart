
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spotquick/models/booked.dart';
import 'package:spotquick/models/cancelation.dart';
import 'package:spotquick/models/login.dart';
import 'package:spotquick/models/relive.dart';
import 'package:spotquick/models/slot.dart';
import 'package:spotquick/models/vehicledetail.dart';
import 'package:spotquick/userscreen/splashscrn.dart';
//hai
const save_key = 'userlogin';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
  Hive.openBox<Relive>('relive');
  Hive.openBox<Slot>('slot');
  Hive.openBox<User>('login');
 
  Hive.openBox<Booked>('booked');
  Hive.openBox<Cancellation>('cancel');
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(SlotAdapter());
  Hive.registerAdapter(VehicleAdapter());
  Hive.registerAdapter(BookedAdapter());
  Hive.registerAdapter(CancellationAdapter());
  Hive.registerAdapter(ReliveAdapter());

 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
          ),
      home: ScreenSplash(),
    );
  }
}

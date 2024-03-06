// cancellation.dart

import 'package:hive/hive.dart';
part 'relive.g.dart';

@HiveType(typeId: 16)
class Relive  {
  
 @HiveField(0)
  int slotnumber;
  @HiveField(2)
  int id;
  Relive({

    required this.slotnumber,
    required this.id
    
  });
}


// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spotquick/fuctions/cancelfunction.dart';
import 'package:spotquick/models/booked.dart';
import 'package:spotquick/models/cancelation.dart';
import 'package:spotquick/userscreen/cancel_function.dart';
import '../adminpages/detailedbook.dart';

class BookingListUser extends StatefulWidget {
  const BookingListUser({Key? key}) : super(key: key);
@override
  State<BookingListUser> createState() => _BookingListUserState();
}
class _BookingListUserState extends State<BookingListUser> {
  String? selectedFloor;
  @override
  void initState() {
    super.initState();
    bookedFunc().getAllBooked();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Center(child: Text('Booking details',style: TextStyle(color: Colors.white),)),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: BookedList,
              builder: (context, List<Booked> bookedlists, Widget? child) {
                return ListView.builder(
                  itemCount: bookedlists.length,
                  itemBuilder: (context, index) {
                    final bookeddata = bookedlists[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            (bookeddata.category == 'Floor1')
                                ? 'T${bookeddata.slotnumber}'
                                : (bookeddata.category == 'Floor2')
                                    ? 'B${bookeddata.slotnumber}'
                                    : (bookeddata.category == 'Floor3')
                                        ? 'C${bookeddata.slotnumber}'
                                        : 'M${bookeddata.slotnumber}',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookDetails(
                                        payment: bookeddata.payment,
                                        category: bookeddata.category ?? "",
                                        slotnumber: bookeddata.slotnumber ?? 0,
                                        ownername: bookeddata.ownername ?? "",
                                        vehiclenum: bookeddata.vehiclenum,
                                        model: bookeddata.model,
                                        license: bookeddata.license,
                                        entreDate: bookeddata.entreDate,
                                        exitDate: bookeddata.exitDate,
                                        enterTime: bookeddata.enterTime,
                                        exitTime: bookeddata.exitTime,
                                      ),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor:
                                      const Color.fromARGB(255, 67, 104, 135),
                                ),
                                child: Text('Details'),),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Cancel Booking'),
                                        content: Text(
                                            'Do you want to cancel this booking?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Cancellation cancel =
                                                  Cancellation(
                                                      category: bookeddata
                                                          .category
                                                          .toString(),
                                                      slotnumber: int.parse(
                                                          bookeddata.slotnumber
                                                              .toString()),
                                                      ownername: bookeddata
                                                          .ownername
                                                          .toString(),
                                                      enterTime:bookeddata.enterTime,
                                                      entreDate: bookeddata.entreDate,
                                                        exitDate: bookeddata.exitDate,
                                                        exitTime: bookeddata.exitTime,
                                                        license:bookeddata.license,
                                                        model: bookeddata.model,
                                                        payment:bookeddata.payment,
                                                        vehiclenum: bookeddata.vehiclenum,
                                                          id: -1);
                                              bookedFunc().deleteslots(
                                                  context, bookeddata.id);
                                              print(bookeddata.id);
                                              Cancelfunction()
                                                  .cancelsave(cancel);
                                              setState(() {});
                                             Navigator.pop(context);
                                            },         
                                            child: Text('Yes'),
                                          ),],);},);},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Colors.red ),
                                child: Text('Cancel'),
                              ),SizedBox(width: 10),],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

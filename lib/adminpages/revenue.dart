// payment_screen.dart

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:spotquick/models/booked.dart';



class PaymentScreen extends StatefulWidget {

  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int totalPayment = 0;
  List<Booked> filteredPayments = [];

  @override
  void initState() {
    super.initState();
    calculateTotalPayment();
  }

  Future<void> calculateTotalPayment() async {
    final Box<Booked> bookedBox = Hive.box<Booked>('booked');
    List<Booked> bookedList = bookedBox.values.toList();
    print(bookedList);
    for (Booked booked in bookedList) {
      totalPayment += int.parse(booked.payment ?? '0');
    }

    setState(() {
      filteredPayments=bookedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Text('Payment Details',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ElevatedButton(
            //   onPressed: () async {
            //     // Your existing logic for adding a payment
            //   },
            //   style: ElevatedButton.styleFrom(
            //     primary: Color.fromARGB(255, 44, 89, 135),
            //   ),
            //   child: Text('Make Payment'),
            // ),

            SizedBox(height: 20),

            // Display total payment
            Text(
              'Total Payment: $totalPayment',
              style: TextStyle(fontSize: 20,color: Colors.red),
            ),

            SizedBox(height: 20),

            // Display filtered payments in a ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: filteredPayments.length,
                itemBuilder: (context, index) {
                  // Customize the ListTile based on your Booked model fields
                  return ListTile(
                    title: Text('Payment: ${filteredPayments[index].payment}'),
                    subtitle: Text('Payment:  ${DateFormat('dd/MM/yyyy').format(DateTime.parse(filteredPayments[index].exitDate))}'),
                    // Add more fields if needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

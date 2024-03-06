// ignore_for_file: prefer_const_constructors, unused_import, file_names, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:spotquick/userscreen/login.dart';
import 'package:spotquick/userscreen/ACCOUNT/cancelhistory.dart';
import 'package:spotquick/userscreen/ACCOUNT/moreinfo.dart';
import 'package:spotquick/userscreen/ACCOUNT/profile_new.dart';


import 'package:url_launcher/url_launcher.dart';

import 'termsandcondition.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
     title: Center(child: Text('Account',style: TextStyle(color: Colors.white),)),
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                  ),
                ),
                InkWell(
                  onTap: () => _launchURL(
                    context,
                    'https://www.freeprivacypolicy.com/live/473b5e25-8942-47d1-9e2e-8697a46639d0',
                  ),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Privacy & Policy'),
                  ),
                ),
                // InkWell(
                //   onTap: () => _showLogoutConfirmationDialog(context),
                //   child: ListTile(leading: Icon(Icons.exit_to_app),
                //   title: Text('Logout'),
                //   ),
                // ),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Moreinfo())),
                     child: ListTile(
                    leading: Icon(Icons.more_horiz),
                    title: Text('More info'),
                  ),
                ),InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsandCondition())),
                     child: ListTile(
                    leading: Icon(Icons.preview_outlined),
                    title: Text('Terms & Condition'),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CancelationScreen())),
                     child: ListTile(
                    leading: Icon(Icons.cancel),
                    title: Text('cancel booking history'),
                  ),
                ),
                // InkWell(
                //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>RliveSlot())),
                //      child: ListTile(
                //     leading: Icon(Icons.remove),
                //     title: Text('Relieve Slot'),
                //   ),
                // ),
                InkWell(
                  onTap: () => _showLogoutConfirmationDialog(context),
                  child: ListTile(leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
      
  }

  void _launchURL(BuildContext context, String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Couldn't launch the page")),
      );
    }
  }
}
 void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }


import 'package:flutter/material.dart';
import 'package:plantify/Add%20Address%20Page.dart';
import 'package:plantify/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Booking extends StatefulWidget {

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late SharedPreferences Addressdata;
  String? Name;
  String? phno;
  String? pincode;
  String? city;
  String? district;
  String? state;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    Addressdata = await SharedPreferences.getInstance();
    setState(() {
      Name = Addressdata.getString('Name')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [Text("Address"), Text("$Name"),
            TextButton(onPressed: (){
              Addressdata.setBool('alreadysaveaddress', false);
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddress(),));
            }, child: Text("Change Address"))],
          ),
        ),
      ),
    );
  }
}

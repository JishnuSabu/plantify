import 'package:flutter/material.dart';
import 'package:plantify/BookingPage.dart';
import 'package:plantify/plantdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddress extends StatefulWidget {
  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final name_controller = TextEditingController();
  final phno_controller = TextEditingController();
  final pincode_controller = TextEditingController();
  final city_controller = TextEditingController();
  final district_controller = TextEditingController();
  final state_controller = TextEditingController();
  final area_controller = TextEditingController();
  final flatno_controller = TextEditingController();
  late SharedPreferences Addressdata;
  bool alreadysaveaddress = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_Saved_address();
  }

  void check_if_Saved_address() async {
    Addressdata = await SharedPreferences.getInstance();
    alreadysaveaddress = (Addressdata.getBool('alreadysaveaddress') ?? false);
    print(alreadysaveaddress);
    if (alreadysaveaddress == true) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Booking()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green[200],
        title: const Text(
          "Add Address",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Divider(
            thickness: 9,
            color: Colors.white,
          ),
          const SizedBox(
            height: 9,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 270.0),
            child: Text(
              "Contact Info",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: TextField(
                  controller: name_controller,
                  decoration: const InputDecoration(
                      hintText: "Name",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: TextField(
                  controller: phno_controller,
                  decoration: const InputDecoration(
                      hintText: "Phone Number",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 9,
            color: Colors.white,
          ),
          const SizedBox(
            height: 9,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 270.0),
            child: Text(
              "Address Info",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4, top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    height: 50,
                    width: 186,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: TextField(
                        controller: pincode_controller,
                        decoration: const InputDecoration(
                            hintText: "Pincode",
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  height: 50,
                  width: 186,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: TextField(
                      controller: city_controller,
                      decoration: const InputDecoration(
                          hintText: "City",
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: TextField(
                  controller: district_controller,
                  decoration: const InputDecoration(
                      hintText: "District",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: TextField(
                  controller: state_controller,
                  decoration: const InputDecoration(
                      hintText: "State",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: TextField(
                  controller: area_controller,
                  decoration: const InputDecoration(
                      hintText: "Locality/Area/Street",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: TextField(
                  controller: flatno_controller,
                  decoration: const InputDecoration(
                      hintText: "Flat no/Building Name",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                primary: Colors.black,
              ),
              onPressed: () {
                saveAddress();
              },
              child: const Padding(
                  padding: EdgeInsets.only(
                      left: 40.0, right: 40, top: 13, bottom: 13),
                  child: Text(
                    "Save Address",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ))),
        ]),
      ),
    );
  }

  Future<void> saveAddress() async {
    Addressdata = await SharedPreferences.getInstance();
    String name = name_controller.text;
    String phno = phno_controller.text;
    String pincode = pincode_controller.text;
    String city = city_controller.text;
    String district = district_controller.text;
    String state = state_controller.text;

    if (name != '' &&
        phno != '' &&
        phno.length >= 10 &&
        pincode != '' &&
        city != '' &&
        district != '' &&
        state != '') {
      print('Successfull');
      Addressdata.setBool('alreadysaveaddress', true);
      Addressdata.setString('Name', name);
      Addressdata.setString('Phone Number', phno);
      Addressdata.setString('pincode', pincode);
      Addressdata.setString('City', city);
      Addressdata.setString('District', district);
      Addressdata.setString('State', state);
      Navigator.of(context)
          .pushNamed("NewBookingPage", arguments: dummyplantdetails);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[400],
          content: const Align(
            alignment: Alignment.center,
            child: Text(
              "Enter Valid details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )));
    }
  }
}

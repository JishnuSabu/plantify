import 'package:flutter/material.dart';
import 'package:plantify/Add%20Address%20Page.dart';
import 'package:plantify/Screens/DetailsScreen.dart';
import 'package:plantify/Screens/HomeScreen.dart';
import 'package:plantify/SuccessfulOrderPage.dart';
import 'package:plantify/main.dart';
import 'package:plantify/plantdetails.dart';
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
      phno = Addressdata.getString('Phone Number')!;
      pincode = Addressdata.getString('pincode')!;
      city = Addressdata.getString('City')!;
      district = Addressdata.getString('District')!;
      state = Addressdata.getString('State')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final plants = dummyplantdetails.whereType<Map>().first;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0Xff0c9869),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreens(),
                  ));
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text("Order Confirmation"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Deliver to:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextButton(
                              onPressed: () {
                                Addressdata.setBool(
                                    'alreadysaveaddress', false);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddAddress(),
                                    ));
                              },
                              child: Text(
                                "Change Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green[900]),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "$Name",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "$city,$district,$state-$pincode",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "$phno",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Donate to Plantify foundation"),
              subtitle: const Text("Support poor childrens"),
              trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const Image(
                      image: AssetImage(
                          "assets/Images/pexels-dazzle-jam-1002061 (1).jpg"))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  DonationRs(
                    rs: "\$10",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DonationRs(
                    rs: "\$20",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DonationRs(
                    rs: "\$50",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DonationRs(
                    rs: "\$100",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DividerCustom(),
            Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Amount Payable",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Text(
                    "${plants["plantprice"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  // dummyplantdetails.map((ex)=>Text("${ex["plantprice"]}")).toList()
                  SizedBox(
                    height: 30,
                    width: 50,
                    child: ListView(
                        padding: EdgeInsets.all(14),
                        children: dummyplantdetails.map((ex) {
                          return Text("${ex["plantprice"]}");
                        }).toList()),
                  ),
                ],
              ),
            ),
            const DividerCustom(),
            const Padding(
              padding: EdgeInsets.only(right: 270.0),
              child: Text(
                "Price Details:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Price:",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      width: 254,
                    ),
                    Text(
                      "\$500",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Delivery Charges:",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      width: 188,
                    ),
                    Text(
                      "\$0",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[200],
                  thickness: 3,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Total Amount:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 188,
                ),
                Text(
                  "\$500",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            const DividerCustom(),
            const Padding(
              padding: EdgeInsets.only(right: 270.0, top: 6),
              child: Text(
                "Cash on delivery!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const DividerCustom(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  primary: const Color(0Xff0c9869),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessfulOrder(),
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30, top: 14, bottom: 14),
                  child: Text(
                    "Place Order",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class DonationRs extends StatelessWidget {
  final String rs;

  const DonationRs({required this.rs});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 62,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 2)),
      child: Center(child: Text(rs)),
    );
  }
}

class DividerCustom extends StatelessWidget {
  const DividerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Divider(
        color: Colors.grey[200],
        thickness: 8,
      ),
    );
  }
}

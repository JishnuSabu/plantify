import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Address"),
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text("Contact Info"),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: TextField(
                  decoration: InputDecoration(
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
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(6)),
              height: 50,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 9,
            color: Colors.grey[300],
          ),
          const Text("Contact Info"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6)),
                height: 50,
                width: 170,
                child: const Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6)),
                height: 50,
                width: 170,
                child: const Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

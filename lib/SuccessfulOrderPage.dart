import 'package:flutter/material.dart';

class SuccessfulOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.green,width: 2)),
          child: const Center(
            child: Text(
              "Congratulations! \nSuccessfully placed your order",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

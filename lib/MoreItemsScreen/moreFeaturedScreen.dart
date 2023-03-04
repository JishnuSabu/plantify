import 'package:flutter/material.dart';
import 'package:plantify/Screens/HomeScreen.dart';
import 'package:plantify/plantdetails.dart';

class MoreFeatured extends StatefulWidget {


  @override
  State<MoreFeatured> createState() => _MoreFeaturedState();
}

class _MoreFeaturedState extends State<MoreFeatured> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0Xff0c9869),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreens(),
                      ));
                },
                child: const Icon(Icons.arrow_back)),
            actions: const [
              Icon(
                (Icons.search),
                size: 26,
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GridView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 260),
                    children: dummyMorefeaturedplantdetails.map(
                          (CustomVariable) {
                        return GestureDetector(
                          onTap: () => gotonextt(context, CustomVariable["plantimage"]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 20),
                            child: Card(
                              shadowColor: const Color(0Xff0c9869),
                              elevation:6,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              // height: 500,
                              // width: 200,
                              // decoration: BoxDecoration(color: Color(0Xff0c9869),borderRadius: BorderRadius.circular((10))),
                              child: Stack(children: [
                                Container(
                                  height: 170,
                                  width: 180,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    child: Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "${CustomVariable["plantimage"]}")),
                                  ),
                                ),
                                Positioned(
                                    bottom: 35,
                                    left: 12,
                                    child: Text(
                                      "${CustomVariable["plantname"]}",
                                      style: const TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    )),
                                Positioned(
                                    right: 12,
                                    bottom: 35,
                                    child: Text(
                                      "${CustomVariable["plantprice"]}",
                                      style: const TextStyle(
                                          color: Color(0Xff0c9869),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Positioned(
                                    left: 12,
                                    bottom: 17,
                                    child: Text("${CustomVariable["place"]}",
                                        style: const TextStyle(
                                            color: Color(0Xff0c9869),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)))
                              ]),
                            ),
                          ),
                        );
                      },
                    ).toList()),
              ),
            ],
          ),
        )
    );
  }
}
void gotonextt(BuildContext context, customVariable) {
  Navigator.of(context)
      .pushNamed("NewDetailsScreen", arguments: customVariable);
}
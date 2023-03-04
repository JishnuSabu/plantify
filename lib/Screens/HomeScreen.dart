import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plantify/MoreItemsScreen/moreFeaturedScreen.dart';
import 'package:plantify/MoreItemsScreen/moreRecommendedScreen.dart';
import 'package:plantify/Screens/DetailsScreen.dart';
import 'package:plantify/Screens/FeaturedDetailsScreen.dart';
import 'package:plantify/plantdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  late SharedPreferences logindata;
  String? username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: const Color(0Xff0c9869),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 159,
            child: Stack(
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0Xff0c9869)),
                ),
                Positioned(
                    left: 104,
                    top: 28,
                    child: Text(
                      "Welcome! $username",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: 56,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                        height: 50,
                        width: 370,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 13, color: Color(0Xff0c9869))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0, top: 3),
                          child: TextField(
                              decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.green[200], fontSize: 20),
                            hintText: "Search",
                            suffixIcon: Icon(Icons.search,
                                size: 30, color: Colors.green[200]),
                          )),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    image:
                    const DecorationImage(fit: BoxFit.fill,
                        image: AssetImage("assets/Images/o.webp"))),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    image:
                    const DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/Images/indoor plants.png"))),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    image:
                    const DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/Images/home plants.webp"))),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    image:
                    const DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/Images/offer.jpg"))),
              ),
            ],
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: .5,
                height: 200,
                enlargeCenterPage: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: true
            ),
          ),
          SizedBox(height: 17,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Recommended",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 130,
              ),
              SizedBox(
                height: 28,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0Xff0c9869),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => moreRecommended(),));},
                    child: const Text(
                      "More",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          RecomendedPlants(),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Featured Plants",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 130,
              ),
              SizedBox(
                height: 28,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0Xff0c9869),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MoreFeatured(),));},
                    child: const Text(
                      "More",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          FeaturedPlants(),
        ],
      )),
    );
  }
}

class RecomendedPlants extends StatefulWidget {
  @override
  State<RecomendedPlants> createState() => _RecomendedPlantsState();
}

class _RecomendedPlantsState extends State<RecomendedPlants> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 700,
      child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: dummyplantdetails.map(
            (CustomVariable) {
              return GestureDetector(
                onTap: () => gotonext(context, CustomVariable["plantimage"]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Card(
                    shadowColor: const Color(0Xff0c9869),
                    elevation: 22,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                          bottom: 50,
                          left: 15,
                          child: Text(
                            "${CustomVariable["plantname"]}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          right: 15,
                          bottom: 50,
                          child: Text(
                            "${CustomVariable["plantprice"]}",
                            style: const TextStyle(
                                color: Color(0Xff0c9869),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          left: 15,
                          bottom: 30,
                          child: Text("${CustomVariable["place"]}",
                              style: const TextStyle(
                                  color: Color(0Xff0c9869),
                                  fontSize: 16,
                                fontWeight: FontWeight.w600
                              )))
                    ]),
                  ),
                ),
              );
            },
          ).toList()),
    );
  }

  void gotonext(BuildContext context, customVariable) {
    Navigator.of(context)
        .pushNamed("NewDetailsScreen", arguments: customVariable);
  }
}
class FeaturedPlants extends StatefulWidget {

  @override
  State<FeaturedPlants> createState() => _FeaturedPlantsState();
}

class _FeaturedPlantsState extends State<FeaturedPlants> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 280,
      width: 570,
      child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: dummyfeaturedplantdetails.map(
                (CustomVariable) {
              return GestureDetector(
                onTap: () => gotonext(context, CustomVariable["plantimage"]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Card(
                    shadowColor: const Color(0Xff0c9869),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                          bottom: 50,
                          left: 12,
                          child: Text(
                            "${CustomVariable["plantname"]}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          right: 15,
                          bottom: 50,
                          child: Text(
                            "${CustomVariable["plantprice"]}",
                            style: const TextStyle(
                                color: Color(0Xff0c9869),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          left: 15,
                          bottom: 30,
                          child: Text("${CustomVariable["place"]}",
                              style: const TextStyle(
                                  color: Color(0Xff0c9869),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              )))
                    ]),
                  ),
                ),
              );
            },
          ).toList()),
    );
  }
}
void gotonext(BuildContext context, customVariable) {
  Navigator.of(context)
      .pushNamed("NewFeaturedDetailsScreen", arguments: customVariable);
}
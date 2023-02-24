import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantify/Add%20Address%20Page.dart';
import 'package:plantify/BookingPage.dart';
import 'package:plantify/Ouantity%20selection.dart';
import 'package:plantify/Screens/HomeScreen.dart';
import 'package:plantify/plantdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late SharedPreferences quantitydata;
  @override
  Widget build(BuildContext context) {
    final plantimage = ModalRoute.of(context)?.settings.arguments;
    final Plants = dummyplantdetails
        .firstWhere((data) => data["plantimage"] == plantimage);
    return Scaffold(
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
            SizedBox(width: 14),
            Icon((Icons.mic), size: 26),
            SizedBox(width: 14),
            Icon(Icons.shopping_cart, size: 26),
            SizedBox(width: 14),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38, top: 20),
            child: Container(
              height: 270,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(14)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("${Plants["plantimage"]}")),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${Plants["plantname"]}",
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
              ),
              const SizedBox(
                width: 140,
              ),
              Text(
                "${Plants["plantprice"]}",
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 29,
                    color: Color(0Xff0c9869)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 289.0),
            child: Text(
              "${Plants["place"]}",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color(0Xff0c9869),
              ),
            ),
          ),
              Divider(thickness: 9,color: Colors.grey[300],),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomTemp(
                    images: "assets/Images/sun.svg",
                  ),
                  CustomTemp(
                    images: "assets/Images/icon_2.svg",
                  ),
                  CustomTemp(
                    images: "assets/Images/icon_3.svg",
                  ),
                  CustomTemp(
                    images: "assets/Images/icon_4.svg",
                  ),
                ],
              ),
              SizedBox(height: 11,),
              Divider(thickness: 9,color: Colors.grey[300],),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    size: 4,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              Text("${Plants["Rating"]}",style: TextStyle(color: Colors.blue),)
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 278.0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "${Plants["Description"]}",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
              SizedBox(height: 6,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    primary:Color(0Xff0c9869),
                  ),
                  onPressed: () async {
                    quantitydata = await SharedPreferences.getInstance();
                    quantitydata.setStringList('list,',list);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAddress(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30, top: 10, bottom: 10),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ))),
        ])));
  }
}

class CustomTemp extends StatelessWidget {
  final String images;

  const CustomTemp({required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
          color: const Color(0xFFF9F8FD),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 15),
              blurRadius: 22,
              color: const Color(0Xff0c9869).withOpacity(0.22),
            ),
            const BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: Colors.white,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: SvgPicture.asset(images),
      ),
    );
  }
}

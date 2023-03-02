import 'package:flutter/material.dart';
import 'package:plantify/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late SharedPreferences logindata;
  String? username;
  String? Email;

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
      Email = logindata.getString('Email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor:  Colors.green[200],
            title: Text(
              "Account",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              Icon(Icons.search,size: 28,color: Colors.green[900],),
            ]),
        backgroundColor: Colors.green[200],
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Container(
              height: 220,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle,color: Colors.blue[800],),
                      Text(
                        "$username",
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.blue[800],
                        size: 20,
                      ),
                      Text(
                        "$Email",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_iphone,
                        color: Colors.blue[800],
                        size: 20,
                      ),
                      const Text(
                        "+91 9562883899",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        primary: Colors.green[300],
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20, top: 10, bottom: 10),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 28,),
          Settings(),
          SizedBox(
            height: 36,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 138.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  primary: Colors.black,
                ),
                onPressed: () {
                  logindata.setBool('newuser', true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30, top: 10, bottom: 10),
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )),
          ),
        ])));
  }
}

class Settings extends StatelessWidget {
  List Iconss = [
    const Icon(Icons.wallet_giftcard),
    const Icon(Icons.indeterminate_check_box_outlined),
    const Icon(Icons.info),
  ];
  List Details = [
    "My Wallet",
    "Terms & Policies",
    "About",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: Iconss.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: ListTile(
                  leading: Iconss[index],
                  title: Text(
                    Details[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue[800],
                  )),
            ),
          ),
        );
      },
    );
  }
}

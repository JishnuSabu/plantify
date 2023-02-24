
import 'package:flutter/material.dart';
import 'package:plantify/AccountPage.dart';
import 'package:plantify/Screens/HomeScreen.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List Screens = [
    HomeScreens(),
    const Text('Home'),
    AccountPage()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor:const Color(0Xff0c9869),
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: index,
          onTap: (tapindex) {
            setState(
                  () {
                index = tapindex;
              },
            );
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourites"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "Account")
          ]),
      body: Screens[index],
    );
  }
}

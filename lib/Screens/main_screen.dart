import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_grub/Screens/container_with_info.dart';
import 'package:go_grub/styles/textstyle.dart';
import 'package:go_grub/Screens/select_location.dart';
import 'dart:async';
import 'package:go_grub/Provider/searchbar_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_grub/Models/restraunts_list.dart';
import 'container_with_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMainScreen extends StatefulWidget {
  const MyMainScreen({super.key});
  @override
  State<MyMainScreen> createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  String selectedLocation = "Select your location";
  int _selectedIndex = 0;

  
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Food'),
    Text('Events'),
    Text('Profile'),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const IconData currency =
      IconData(0xf02fa, fontFamily: 'MaterialIcons');
  final List<String> imagePaths = [
    'Assets/images/Food/biryani.png',
    'Assets/images/Food/burger.png',
    'Assets/images/Food/cake.png',
    'Assets/images/Food/chole.png',
    'Assets/images/Food/dosa.png',
    'Assets/images/Food/gulab.png',
    'Assets/images/Food/idli.png',
    'Assets/images/Food/noodles.png',
    'Assets/images/Food/omlet.png',
    'Assets/images/Food/pakoda.png',
  ];
  final List<String> imagePaths2 = [
    'Assets/images/Food/paratha.png',
    'Assets/images/Food/pavbhaji.png',
    'Assets/images/Food/pizza.png',
    'Assets/images/Food/puri.png',
    'Assets/images/Food/rolls.png',
    'Assets/images/Food/salad.png',
    'Assets/images/Food/shakes.png',
    'Assets/images/Food/tea.png',
    'Assets/images/Food/upma.png',
    'Assets/images/Food/puri.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final selectedCity = await Navigator.pushNamed(
                              context, 'location_selector') as String?;

                          if (selectedCity != null) {
                            setState(() {
                              selectedLocation = selectedCity;
                              print(
                                  "Selected City: $selectedCity"); // Update selectedLocation with the selected city
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 50,
                            width: 300,
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.edit_location_sharp,
                                  color: Colors.green,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 35,
                              ),
                              title: Text(
                                'Selected Location',
                                style: mystyle.defaultTextStyle,
                              ),
                              subtitle: Text(selectedLocation),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CupertinoButton(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 29),
                          child: Icon(
                            CupertinoIcons.person_circle_fill,
                            color: Color.fromARGB(255, 55, 59, 55),
                            size: 38,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'profile');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Consumer<SearchModel>(
                    builder: (context, model, _) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: model.text,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 144, 140, 140)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Image.asset(
                              "Assets/images/Banners/biryani_1.jpg",
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              "Assets/images/Banners/rice_1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.amber,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 7, top: 7),
                                child: Text(
                                  "Deals For You",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              // Add space between text and divider
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 70,
                                  width: 185,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(70, 144, 237, 131),
                                        const Color.fromARGB(255, 255, 255, 255)
                                      ],
                                      stops: [0.2, 0.7],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                      title: Text(
                                        "super saver",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                      subtitle: Text(
                                        "Free Delivery",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.green),
                                      ),
                                      trailing: SvgPicture.asset(
                                        'Assets/images/Profile/rupees.svg',
                                        width: 40,
                                        height: 40,
                                        color: Colors.green,
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 70,
                                  width: 185,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(70, 232, 213, 119),
                                        Colors.white
                                      ],
                                      stops: [0.2, 0.7],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                      title: Text(
                                        "UNDER 99",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 148, 92, 9)),
                                      ),
                                      subtitle: Text(
                                        "Value Deals",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: const Color.fromARGB(
                                                255, 148, 92, 9)),
                                      ),
                                      trailing: SvgPicture.asset(
                                          'Assets/images/Profile/food.svg',
                                          width: 40,
                                          height: 40,
                                          color: const Color.fromARGB(
                                              255, 148, 92, 9))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 70,
                                  width: 185,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(70, 232, 169, 190),
                                        Colors.white
                                      ],
                                      stops: [0.2, 0.7],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      "60% OFF",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink),
                                    ),
                                    subtitle: Text(
                                      "First Order",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.pink),
                                    ),
                                    trailing: SvgPicture.asset(
                                      'Assets/images/Profile/celebrate.svg',
                                      width: 40,
                                      height: 40,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  height: 70,
                                  width: 185,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(98, 160, 233, 240),
                                        Colors.white,
                                      ],
                                      stops: [0.2, 0.7],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      "ALL DEALS",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.cyan),
                                    ),
                                    subtitle: Text(
                                      "Min 60% Off",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.cyan),
                                    ),
                                    trailing: SvgPicture.asset(
                                      'Assets/images/Profile/box.svg',
                                      width: 40,
                                      height: 40,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1, right: 10),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 7, top: 7),
                                child: Text(
                                  "Are You Looking For This?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              // Add space between text and divider
                              Expanded(
                                child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (String path in imagePaths)
                                    Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Image.asset(
                                        path,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (String path in imagePaths2)
                                    Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Image.asset(
                                        path,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7, top: 7),
                        child: Text(
                          "Restaurants Near You",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //********** image starts here
                  ResInfo(
                    productList: ProductList,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_sharp),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.celebration),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

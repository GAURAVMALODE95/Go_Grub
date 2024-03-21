import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_grub/Screens/cart.dart';
import 'package:go_grub/Screens/res_Screen_builder.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';

class ResScreen extends StatefulWidget {
  final String title;

  const ResScreen({Key? key, required this.title}) : super(key: key);

  @override
  _ResScreenState createState() => _ResScreenState();
}

class _ResScreenState extends State<ResScreen> {
  late Future<List<dynamic>> _futureRestaurants;
   late String title;

  @override
  void initState() {
    super.initState();
     title = widget.title;
    _futureRestaurants = fetchRestaurants();
  }

  Future<List<dynamic>> fetchRestaurants() async {
    final response =
        await http.get(Uri.parse('http://192.168.50.40:3000/restaurants'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<List<dynamic>>(
        future: _futureRestaurants,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LinearProgressIndicator(
              color: const Color.fromARGB(255, 108, 196, 111),
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> restaurants = snapshot.data!;
            final restaurant = restaurants.firstWhere(
                (element) => element['restaurant_name'] == widget.title,
                orElse: () => {});

            return Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 15),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color.fromARGB(255, 230, 86, 86),
                  mini: false,
                  heroTag: null,
                  elevation: 6.0,
                  child: Icon(Icons.restaurant_menu_sharp, size: 30),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Color.fromARGB(98, 54, 55, 64),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          right: 13,
                          left: 13,
                          bottom: 10,
                        ),
                        child: Center(
                          child: Container(
                            height: 320,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 300, bottom: 10),
                                  child: CupertinoButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,'mycart');
                                    },
                                    padding: EdgeInsets.all(15),
                                    color: const Color.fromARGB(255, 236, 84, 73),
                                    borderRadius: BorderRadius.circular(40),
                                    child: Icon(
                                      CupertinoIcons.cart,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    widget.title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${restaurant['rating']}/5 - ${restaurant['delivers_in']}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 81, 81),
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        child: Text(" • "),
                                      ),
                                      Text(
                                        restaurant['cost_for_two'],
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 81, 81),
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    restaurant['categories'],
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 138, 135, 135),
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.withOpacity(0.3)),
                                SizedBox(height: 2),
                                Container(
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "Assets/images/Profile/shop.svg",
                                              color: Color.fromARGB(
                                                  255, 81, 74, 74),
                                              width: 22,
                                              height: 22,
                                            ),
                                            SizedBox(height: 20),
                                            SvgPicture.asset(
                                              "Assets/images/Profile/home.svg",
                                              color: const Color.fromARGB(
                                                  255, 81, 74, 74),
                                              width: 22,
                                              height: 22,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Text(
                                              "Outlet",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: const Color.fromARGB(
                                                    255, 24, 23, 23),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 27),
                                            Text(
                                              "25-30 mins",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color.fromARGB(
                                                    255, 24, 23, 23),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Text(
                                              "Nashik Road",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color.fromARGB(
                                                    150, 68, 65, 65),
                                              ),
                                            ),
                                            SizedBox(height: 27),
                                            Text(
                                              "Your Location",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color.fromARGB(
                                                    150, 68, 65, 65),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.withOpacity(0.3)),
                                SizedBox(height: 2),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Free delivery on your first order",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Color.fromARGB(255, 188, 171, 171),
                              width: 1),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                height: 45,
                                width: 45,
                                child: Image.asset(
                                  "Assets/images/Avatar/discount.png",
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "FREE DELIVERY",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "FREE DELIVERY ON FIRST ORDER",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 107, 100, 100),
                                      fontFamily: 'Roboto',
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "Assets/images/Profile/spoon.svg",
                            color: Colors.grey,
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "MENU",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15,
                                letterSpacing: 1.5,
                                color: const Color.fromARGB(255, 27, 26, 26)),
                          ),
                          SizedBox(width: 4),
                          SvgPicture.asset(
                            "Assets/images/Profile/spoon.svg",
                            color: Colors.grey,
                            width: 22,
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    MyResScreen(title: widget.title),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

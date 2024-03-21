import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_grub/Models/cart_model.dart';
import 'package:go_grub/Provider/cart_provider.dart';
import 'package:go_grub/Provider/counter_provider.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var containerColor1 = Colors.white;
  var containerColor2 = Colors.white;
  var containerColor3 = Colors.white;
  var containerColor4 = Colors.white;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Cart>(context);

    final restaurantName = productProvider.items.isNotEmpty
        ? productProvider.items.first.resname
        : 'Restaurant Name';

    return SingleChildScrollView(
      child: Material(
        child: Container(
          color: Color.fromARGB(96, 205, 206, 212),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        restaurantName,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: const Color.fromARGB(255, 55, 52, 52)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(90, 222, 74, 74),
                      Color.fromARGB(26, 169, 168, 168),
                    ]),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            child: Text("Saved ₹99 ON Free Delivery",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: productProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = productProvider.items[index];

                      return Column(
                        children: [
                          ListTile(
                            leading: SvgPicture.asset(
                              "Assets/images/Profile/veg.svg",
                              color: Colors.green,
                              width: 22,
                              height: 22,
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Roboto',
                                color: const Color.fromARGB(255, 43, 41, 41),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: Container(
                                    child: Text(
                                      item.price.toString(),
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 43, 41, 41),
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                height: 35,
                                width: 101,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 235, 216, 216),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 7,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.counter--;
                                          item.price = item.price - item.price;
                                        });
                                      },
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.redAccent,
                                        size: 20,
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: const Color.fromARGB(
                                          255, 173, 144, 144),
                                    ),
                                    Text(
                                      item.counter.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Lato',
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: const Color.fromARGB(
                                          255, 173, 155, 155),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.counter++;
                                          item.price = item.price * 2;
                                        });
                                      },
                                      child: Icon(
                                        CupertinoIcons.plus,
                                        color: Colors.redAccent,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              child: Divider(
                                height: 1,
                                color: Color.fromARGB(255, 204, 190, 190),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  child: Text(
                    "Delivery Instructions",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Color.fromARGB(255, 59, 53, 53),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          containerColor1 = Color.fromARGB(99, 143, 203, 106);
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: containerColor1,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_city,
                              size: 30,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Container(
                                  child: Text(
                                "Directions to Reach",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          containerColor2 = Color.fromARGB(99, 143, 203, 106);
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: containerColor2,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_off,
                              size: 30,
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Container(
                                  child: Text(
                                "Don't Ring Bell",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          containerColor3 = Color.fromARGB(99, 143, 203, 106);
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: containerColor3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.door_back_door_outlined,
                              size: 30,
                              color: Colors.brown,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Container(
                                  child: Text(
                                "Leave at Doorstep",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          containerColor4 = Color.fromARGB(99, 143, 203, 106);
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: containerColor4,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mobile_off,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              // Wrap the Text widget with Center
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 6, right: 6),
                                child: Container(
                                    child: Text(
                                  "Avoid Calling",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Bills Details",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Color.fromARGB(255, 59, 53, 53),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Item Total",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              productProvider.itemtotal().toString(),
                              style: TextStyle(
                                fontFamily: 'Lato',
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Delivery Fee",
                              style: TextStyle(
                                color: Color.fromARGB(255, 185, 174, 174),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              "Free",
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.green),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Free Delivery on First Order",
                          style: TextStyle(
                            color: Color.fromARGB(255, 185, 174, 174),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Divider(
                          height: 2,
                          color: Color.fromARGB(255, 185, 174, 174),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Delivery Tip",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              "ADD TIP",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color.fromARGB(255, 213, 55, 55)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Platform Fees",
                              style: TextStyle(
                                color: Color.fromARGB(255, 185, 174, 174),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              productProvider.service.toString(),
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: const Color.fromARGB(255, 24, 24, 24)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "GST and Others",
                              style: TextStyle(
                                color: Color.fromARGB(255, 185, 174, 174),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              productProvider.gst.toString(),
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: const Color.fromARGB(255, 28, 29, 28)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Divider(
                          height: 2,
                          color: Color.fromARGB(255, 185, 174, 174),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Total Payable",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              "₹${productProvider.itemtotalWithTax().toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                  color: const Color.fromARGB(255, 28, 29, 28)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "GO-Green Initiative",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Color.fromARGB(255, 59, 53, 53),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 12, top: 20),
                        child: Text(
                          "Make a meaningful contribution by donating to the Go Green Foundation, an organization dedicated to environmental preservation. Your support will directly fund tree planting initiatives, fostering biodiversity and combating climate change. Join us in our mission to create a greener, healthier planet for future generations, one tree at a time.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 114, 109, 109),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120, right: 120),
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.heart_circle,
                                    color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Donate",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color.fromARGB(255, 211, 26, 26),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'pay');
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                     
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 223, 37, 37),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Center(
                              child: Text(
                                "Continue To Pay",
                                style: TextStyle(
                                  letterSpacing: 0.3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

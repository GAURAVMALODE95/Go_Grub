import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_grub/Models/restraunts_list.dart';
import 'package:go_grub/Provider/heart_provider.dart';
import 'package:provider/provider.dart';

class MyFav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> favoriteItems =
        Provider.of<HeartProvider>(context).getWishlistItems();

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height *
                  0.75, // Adjust this as needed
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "Assets/images/Food/favban2.jpg",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WE KNOW WHAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'YOU LOVE!',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: favoriteItems.map((title) {
                Product product =
                    ProductList.firstWhere((element) => element.title == title);

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.fill,
                                    width: 175,
                                    height: 155,
                                  ),
                                ),
                                Positioned(
                                  bottom: 6,
                                  left: 17,
                                  child: Column(
                                    children: [
                                      Text(
                                        product.discount,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 170,
                            decoration: BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.more_vert),

                                  
                                ),
                                Text(
                                  product.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  product.category,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 138, 135, 135),
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Flexible(
                                      child: Text(
                                        product.location,
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
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'Assets/images/Profile/star.svg',
                                      width: 20,
                                      height: 20,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      product.rating,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "Assets/images/Profile/order.png",
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "Free Delivery",
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: const Color.fromARGB(
                                                  255, 66, 198, 71),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(98, 157, 222, 159),
                                            Colors.white,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

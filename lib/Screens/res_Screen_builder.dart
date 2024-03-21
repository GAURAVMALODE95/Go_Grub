import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_grub/Models/cart_model.dart';
import 'package:go_grub/Provider/cart_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class MyResScreen extends StatelessWidget {
  final String title;

  const MyResScreen({Key? key, required this.title}) : super(key: key);

  Future<List<dynamic>> fetchMenuItems() async {
    String Title1 = title;
    final response =
        await http.get(Uri.parse('http://192.168.50.40:3000/restaurants'));
    if (response.statusCode == 200) {
      List<dynamic> restaurants = json.decode(response.body);
      var restaurant = restaurants.firstWhere(
        (element) => element['restaurant_name'] == title,
        orElse: () => null,
      );
      if (restaurant != null && restaurant['menu'] != null) {
        return restaurant['menu'];
      } else {
        throw Exception('Menu not found for the restaurant.');
      }
    } else {
      throw Exception('Failed to fetch menu data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<List<dynamic>>(
        future: fetchMenuItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> menuItems = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 18),
              child: Column(
                children: menuItems.map((item) {
                  return MenuItemWidget(
                    item: item,
                    title: title,
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

class MenuItemWidget extends StatefulWidget {
  final dynamic item;
  final String title;

  const MenuItemWidget({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "Assets/images/Profile/veg.svg",
                        color: Colors.green,
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(height: 7),
                      Text(
                        widget.item['item_name'],
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromARGB(255, 53, 50, 50),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '₹${widget.item['cost']}',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromARGB(255, 69, 63, 63),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "Assets/images/Profile/star.svg",
                            color: Colors.green,
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${widget.item['review_number']}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "(${widget.item['total_reviews']})",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color.fromARGB(255, 114, 101, 101),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.item['description'],
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: const Color.fromARGB(255, 91, 84, 84),
                        ),
                        softWrap: true,
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(
                        widget.item['image_url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    right: 15,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        print('Title1111111111: ${widget.title}');

                        setState(() {
                          isAdded = true;
                        });
                        final cart = Provider.of<Cart>(context, listen: false);
                        final product = Product(
                          name: widget.item['item_name'],
                          price: widget.item['cost'],
                          resname: widget.title,
                          counter: 1,
                        );

                        cart.addToCart(product);
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: isAdded
                              ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : Text(
                                  'ADD',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Container(
            child: Divider(
              thickness: 0.7,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}

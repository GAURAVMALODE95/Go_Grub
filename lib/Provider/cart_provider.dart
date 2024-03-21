import 'package:flutter/material.dart';
import 'package:go_grub/Models/cart_model.dart';

class Cart extends ChangeNotifier {
  final List<Product> _items = [];
  late List<int> _counters;

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }


  double calculateTotalPrice() {
    double totalPrice = 0;
    for (Product item in _items) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  double itemtotal() {
    double itemtotal = 0;
    for (Product item in _items) {
      itemtotal += item.price;
    }

    return itemtotal;
  }

   double get gst {
    return calculateTotalPrice() * 0.05;
  }

  double get service {
    return calculateTotalPrice() * 0.01;
  }
double itemtotalWithTax() {
  double total = itemtotal(); 
  double totalWithTax = total + gst + service; 
  return totalWithTax;
}

}

import 'package:flutter/material.dart';
import 'package:go_grub/Models/restraunts_list.dart';
import 'package:go_grub/Screens/Login.dart';
import 'package:go_grub/Screens/Profile.dart';
import 'package:go_grub/Screens/cart.dart';
import 'package:go_grub/Screens/favourites.dart';
import 'package:go_grub/Screens/main_screen.dart';
import 'package:go_grub/Screens/otpverification.dart';
import 'package:go_grub/Screens/payment.dart';
import 'package:go_grub/Screens/res_screen.dart';
import 'package:go_grub/Screens/select_location.dart';
import 'package:go_grub/Models/restraunts_list.dart';
import 'package:go_grub/Provider/heart_provider.dart';

Map<String, WidgetBuilder> appRoutes = {
  'OtpVerification': (context) => Otpverification(),
  'Login': (context) => Login(),
  'homepage': (context) => MyMainScreen(),
  'location_selector': (context) => SelectLocation(),
  'profile': (context) => Profile(),
  'fav': (context) => MyFav(),
  'rescreen': (context) => ResScreen(title: 'dog'),
  'mycart': (context) => MyCart(),
  'pay': (context) => MyPayment(),
};

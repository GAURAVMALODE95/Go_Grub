import 'package:flutter/material.dart';
import 'package:go_grub/Models/restraunts_list.dart';
import 'package:go_grub/Provider/cart_provider.dart';
import 'package:go_grub/Provider/counter_provider.dart';
import 'package:go_grub/Provider/heart_provider.dart';
import 'package:go_grub/Provider/searchbar_provider.dart';
import 'package:go_grub/Screens/main_screen.dart';
import 'package:go_grub/Screens/res_Screen_builder.dart';
import 'package:go_grub/Screens/res_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_grub/Provider/time_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_grub/Routes/approutes.dart';
import 'package:go_grub/Screens/Login.dart';
import 'package:go_grub/Screens/splashscreen.dart';
import 'package:go_grub/Provider/number_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TextFieldProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
        ChangeNotifierProvider(create: (context) => HeartProvider()),
        ChangeNotifierProvider(create: (context) => SearchModel()),
        ChangeNotifierProvider(create: (context) => Cart()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: appRoutes,
        home: SplashScreen(),
      ),
    );
  }
}

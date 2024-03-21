import 'package:flutter/material.dart';
import 'package:go_grub/Screens/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 second
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromARGB(200, 66, 154, 69),
      child: Center(
        child: Text(
          "Go-Grub",
          style: TextStyle(
            wordSpacing: 0.7,
            letterSpacing: 0.7,
            decoration: TextDecoration.none,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 50,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }
}

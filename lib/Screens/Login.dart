import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_grub/Provider/number_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  static String verify = "";

  @override
  Widget build(BuildContext context) {
    
    var outnumber = Provider.of<TextFieldProvider>(context);
    String code= "+91";
    String num = outnumber.entvalue;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'Assets/images/Login/login1.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 300,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'homepage');
                    },
                    child: Container(
                      height: 25,
                      width: 80,
                      child: Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 227, 209, 209),
                            fontFamily: 'Lato',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 60, 148, 63),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 530,
                  left: 40,
                  right: 40,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.white),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Login or sign up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 207, 200, 200),
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(50, 207, 200, 200),
                          ),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              outnumber.entvalue = value;
                            },
                            maxLength: 10,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 12, right: 10),
                                child: Text(
                                  "+91",
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    wordSpacing: 0.3,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: " Enter Phone Number",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 17,
                              ),
                              counterText: '',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                             await FirebaseAuth.instance.verifyPhoneNumber(
                               phoneNumber: code + num,
                               verificationCompleted:
                                   (PhoneAuthCredential credential) {},
                               verificationFailed: (FirebaseAuthException e) {},
                               codeSent:
                                   (String verificationId, int? resendToken) {
                                    Login.verify=verificationId;
                                   },
                               codeAutoRetrievalTimeout:
                                   (String verificationId) {},
                             );
                            Navigator.pushNamed(context, "OtpVerification");
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 19,
                                  letterSpacing: 0.3,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromARGB(255, 60, 148, 63),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.white),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 40,
                          width: 190,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      'Assets/images/Avatar/googlelogo.jpg'),
                                ),
                              ),
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      'Assets/images/Avatar/facebook_logo.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

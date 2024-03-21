import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_grub/Provider/time_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_grub/Screens/Login.dart';
import 'package:go_grub/Provider/number_provider.dart';

class Otpverification extends StatelessWidget {
  const Otpverification({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    
    var outnumber = Provider.of<TextFieldProvider>(context);
    
    Provider.of<TimerProvider>(context, listen: false).resetTimer();
    String num = outnumber.entvalue;
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    TextEditingController controller5 = TextEditingController();
    TextEditingController controller6 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "Login");
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          "OTP Verification",
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: Text(
                    "We have sent verification code to ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+91-",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    num,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 45,
                        width: 40,
                        child: TextField(
                          controller: controller1,
                          onChanged: (value) => {
                            if (value.length == 1)
                              {
                                FocusScope.of(context).nextFocus(),
                              }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          cursorColor: controller1.text.length == 1 ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 155, 155, 155),
                              fontFamily: "Roboto",
                            ),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 40,
                        child: TextField(
                          controller: controller2,
                          onChanged: (value) => {
                            if (value.length == 1)
                              {
                                FocusScope.of(context).nextFocus(),
                              }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 155, 155, 155),
                              fontFamily: "Roboto",
                            ),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 40,
                        child: TextField(
                          controller: controller3,
                          onChanged: (value) => {
                            if (value.length == 1)
                              {
                                FocusScope.of(context).nextFocus(),
                              }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 155, 155, 155),
                              fontFamily: "Roboto",
                            ),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 40,
                        child: TextField(
                          controller: controller4,
                          onChanged: (value) => {
                            if (value.length == 1)
                              {
                                FocusScope.of(context).nextFocus(),
                              }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 155, 155, 155),
                              fontFamily: "Roboto",
                            ),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 40,
                        child: TextField(
                          controller: controller5,
                          onChanged: (value) => {
                            if (value.length == 1)
                              {
                                FocusScope.of(context).nextFocus(),
                              }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 155, 155, 155),
                              fontFamily: "Roboto",
                            ),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 40,
                        child: TextField(
                          controller: controller6,
                          onChanged: (value) => {
                            if (value.length == 1)
                              {
                                FocusScope.of(context).nextFocus(),
                              }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 155, 155, 155),
                              fontFamily: "Roboto",
                            ),
                            counterText: '',
                            border: InputBorder.none,
                          ),
                        ),
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 20,

                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive OTP?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 3),
                    Consumer<TimerProvider>(
                      builder: (context, timerProvider, _) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                timerProvider.resetTimer();
                              },
                              child: Text(
                                timerProvider.seconds > 0
                                    ? "Resend in ${timerProvider.seconds} sec"
                                    : "Resend now",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 120, 113, 113),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                ),
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  String otp = controller1.text +
                      controller2.text +
                      controller3.text +
                      controller4.text +
                      controller5.text +
                      controller6.text;
                  try {
                    String smsCode = otp;
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: Login.verify,
                      smsCode: smsCode,
                    );

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);

                    // If no error occurs, navigate to homescreen
                    Navigator.pushNamed(context, 'homepage');
                  } catch (e) {
                    // Handle any errors here
                    print("Error occurred: $e");
                    // You can show a snackbar, toast, or any other error handling mechanism here
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    child: Center(
                      child: Text(
                        "Verify",
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
              ),
              SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "Login");
                },
                child: Text(
                  "Back to Login methods",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                    fontFamily: 'Roboto',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

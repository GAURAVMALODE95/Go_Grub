import 'package:flutter/material.dart';
import 'package:go_grub/Screens/payments_model.dart';

class MyPayment extends StatelessWidget {
  const MyPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: Container(
            color: Color.fromARGB(96, 205, 206, 212),
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10),
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
                          
                          "Payment Options",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: const Color.fromARGB(255, 55, 52, 52),
                          ),
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Container(
                            child: Text(
                              "Suggested Options",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          height: 350, // Constrain the height of the ListView
                          child: ListView.builder(
                            itemCount: paymentMethods.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(paymentMethods[index].name),
                                trailing: Container(
                                  height: 40,
                                  width: 70,
                                  child: Image.asset(
                                    paymentMethods[index].imagePath,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                               
                              );
                            },
                          ),
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
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.add_circle_outline,
                            color: const Color.fromARGB(255, 55, 52, 52)),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Add Gift Card",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: const Color.fromARGB(255, 55, 52, 52),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 270,
                          child: TextField(
                            decoration:InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add Promo Code",
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          
                          decoration: BoxDecoration(
                             color: Colors.green,
                             borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12))
                          ),
                          child: Center(
                            child: Text("apply",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600

                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

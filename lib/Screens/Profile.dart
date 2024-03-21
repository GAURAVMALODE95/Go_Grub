import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_grub/styles/textstyle.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 238, 241),
      appBar: AppBar(
        elevation: 0.5,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'homepage');
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Color.fromARGB(255, 227, 233, 237),
        shadowColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  //color: Colors.amber
                ),
                // color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 42,
                      backgroundImage:
                          AssetImage("Assets/images/Profile/avatar.jpg"),
                      backgroundColor:
                          Colors.transparent, // Ensure transparent background
                      // Fit the image within the CircleAvatar while maintaining its aspect ratio
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("Assets/images/Profile/avatar.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Gaurav',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                    ),
                    subtitle: Text(
                      "View recent orders",
                      selectionColor: const Color.fromARGB(255, 131, 212, 133),
                    ),
                    trailing: GestureDetector(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.topRight,
                        height: 40,
                        width: 100,
                        child: Center(
                            child: Text(
                          " Go prime >",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Roboto',
                              fontSize: 15),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.green)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'fav');
                    },
                    child: Container(
                        height: 60,
                        width: 185,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                            title: Text(
                              "Favourites ",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                            ),
                            leading: Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                              size: 30,
                            ))),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                      height: 60,
                      width: 185,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                          title: Text(
                            "Money ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                          leading: Icon(
                            Icons.currency_rupee_sharp,
                            color: Colors.green,
                            size: 30,
                          ))),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.update),
                  title: Text(
                    "Check for updates",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.person),
                  title: Text(
                    "Your profile",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.star),
                  title: Text(
                    "Recent ratings",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.contact_support),
                  title: Text(
                    "Contact support",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.card_giftcard),
                  title: Text(
                    "Refer and earn",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.delivery_dining_outlined),
                  title: Text(
                    "Delivery partner program",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.ios_share),
                  title: Text(
                    "Share our app",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.privacy_tip),
                  title: Text(
                    "Privacy policy",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(Icons.document_scanner),
                title: Text(
                  "Terms & conditions",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
           SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(Icons.logout),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
           SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(Icons.star_border),
                title: Text(
                  "Rate us",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,)
            
          ],
        ),
      ),
    );
  }
}

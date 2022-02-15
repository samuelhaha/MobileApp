import 'package:flutter/material.dart';

import 'signin.page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 50.0, horizontal: 20.0), //down from upwards
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0), //CIRCLE
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0, //shadow spread
                        offset: Offset(0,
                            4.0), //first  number = horizontal, second number = vertical (x,y)
                        color: Colors.black38,
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/breakfast.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Samuel Leow",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "+65 92921921",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "test@gmail.com",
                      style: TextStyle(fontSize: 14.0),
                    ),
                     SizedBox(
                      height: 20.0,
                    ),
                    // Container(
                    //     height: 25.0,
                    //     width: 60.0,
                    //     decoration: BoxDecoration(
                    //         border: Border.all(
                    //           color: Colors.blue,
                    //         ),
                    //         borderRadius: BorderRadius.circular(20.0)),
                    //     child: Center(
                    //       child: Text(
                    //         "Edit",
                    //         style:
                    //             TextStyle(color: Colors.blue, fontSize: 16.0),
                    //       ),
                    //     )
                    //     ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));
                      },
                      child: Container(
                        width: 130.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

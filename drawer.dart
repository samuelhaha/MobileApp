import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/about_page.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/order_page.dart';
import 'package:flutter_application_1/src/pages/profile_page.dart';
import 'package:flutter_application_1/src/pages/signin.page.dart';
import 'package:flutter_application_1/src/pages/drawer.dart';

class MyDrawer extends StatelessWidget{
  final Function onTap;
  MyDrawer({this.onTap});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              // decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  // children: <Widget>[
                  //   // Container(
                  //   //   width: 60,
                  //   //   height: 60,
                  //   //   child: CircleAvatar(
                        
                  //   //   ),
                  //   // ),
                  //   SizedBox(height: 15,),
                  //   Text('Super Hero',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white),
                  //   ),
                  //   SizedBox(height: 3,),
                  //   Text('lhbxsam@gmail.com',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white),
                  //   ), 
                  // ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => onTap(context, 0, 'Home'),
            ),
             ListTile(
              leading: Icon(Icons.home),
              title: Text('OrderPage'),
              onTap: () => onTap(context, 1, 'OrderPage'),
            ),
             ListTile(
              leading: Icon(Icons.home),
              title: Text('About'),
              onTap: () => onTap(context, 2, 'About'),
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => onTap(context, 3, 'Profile'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Sign In / Sign Up'),
              onTap: () => onTap(context, 4, 'Sign In / Sign Up'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Home'),
              onTap: () => onTap(context, 0, 'Home'),
            ),
            
          ],
        ),
      ),
    );
  }
}
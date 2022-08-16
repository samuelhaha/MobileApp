import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/favourite.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/order_page.dart';
import 'package:flutter_application_1/src/pages/profile_page.dart';
import 'package:flutter_application_1/src/pages/signin.page.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            // 'Navigation Drawer',
            'About'),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // UserAccountsDrawerHeader(
            //   accountName: Text('Samuel'),
            //   accountEmail: Text('lhbxsam@gmail.com')
            // ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(color: Colors.red),
              child: Center(
                child: Text(
                  'signed in as: ' + user.email,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_outline_outlined,
              ),
              title: const Text('FavouritePage'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavouritePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.accessibility_sharp,
              ),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.bookmarks_rounded,
              ),
              title: const Text('Order Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  "The Story of Food Delivery",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Image.asset(
              'assets/images/background2.jpg',
              width: 420.0,
              height: 280.0,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                'We’re a fully distributed team of 85 people living and working in 15 countries around the world. And we’re working to build the best products to help our customers build their brands and grow their businesses on social media.',
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  "The Story of Food Delivery",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Image.asset(
              'assets/images/background2.jpg',
              width: 420.0,
              height: 280.0,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'When the founder and CEO Will Shu moved to London in 2013 he discovered a city full of great restaurants, but he was amazed that so few of them delivered food. ',
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'He made it his personal mission to bring the best local restaurants direct to people’s doors. Today, Deliveroo operates a hyperlocal three-sided marketplace, connecting local consumers, restaurants and grocers, and riders to fulfill a mission critical, emotional purchase in under 30 minutes. By offering fast and reliable delivery which consumers can track online, Deliveroo has grown rapidly. Deliveroo now operates in 11 markets worldwide, working with thousands of restaurants and grocers, thousands of riders, and serving millions of consumers.',
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      launch('tel:+65 98991344');
                    },
                    child: Text("Make a Call"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launch(
                          'mailto:lhbxsam@gmail.com?subject=This is Subject Title&body= This is Body of Email');
                    },
                    child: Text("Email"),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

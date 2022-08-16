import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/about_page.dart';
import 'package:flutter_application_1/src/pages/cartprovider.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/order_page.dart';
import 'package:flutter_application_1/src/pages/profile_page.dart';
import 'package:flutter_application_1/src/pages/signin.page.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            // 'Navigation Drawer',
            'Favourites'),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30.0,
            ),
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
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("favourites")
                .doc(FirebaseAuth.instance.currentUser.email)
                .collection("items")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something is Wrong"),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (_, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data.docs[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Text(documentSnapshot['name']),
                        title: Text(
                          "\$ ${documentSnapshot['price']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: CircleAvatar(
                          child: Icon(Icons.clear),
                        ),
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection("favourites")
                              .doc(FirebaseAuth.instance.currentUser
                                  .email) //the account's email that is currently logged in right now!
                              .collection("items")
                              .doc(documentSnapshot.id)
                              .delete(); //delete after pressing clear icon!
                        },
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

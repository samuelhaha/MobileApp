import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/about_page.dart';
import 'package:flutter_application_1/src/pages/favourite.dart';
import 'package:flutter_application_1/src/pages/fooddetail.dart';
import 'package:flutter_application_1/src/pages/order_page.dart';
import 'package:flutter_application_1/src/pages/profile_page.dart';
import 'package:flutter_application_1/src/pages/signin.page.dart';
import 'package:provider/provider.dart';

import 'cartprovider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  List products = [];
  var firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn = await firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        products.add({
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-img": qn.docs[i]["product-img"],
        });
      }
    });
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
        //a widget in Flutter used to implements the basic material design visual layout structure.

        appBar: AppBar(
          centerTitle: true,
          title: const Text(
              // 'Navigation Drawer',
              'Food Center'),
          // actions: <Widget>[
          //   //CartButton = action
          //   Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Container(
          //         height: 150.0,
          //         width: 30.0,
          //         child: InkWell(
          //           splashColor: Colors.redAccent,
          //           highlightColor: Colors.blueAccent.withOpacity(0.5),
          //           onTap: () {
          //             Navigator.push(
          //               //Add a route to the stack of routes
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => OrderPage(),
          //               ),
          //             );
          //           },
          //           child: Stack(
          //             //placing on top of each other
          //             children: <Widget>[
          //               IconButton(
          //                   icon: Icon(
          //                     Icons.shopping_cart,
          //                     color: Colors.white, //Cart will be in white color
          //                   ),
          //                   onPressed: () {
          //                     OrderPage();
          //                   }),
          //               Positioned(
          //                 //use to position child widgets in stack widget
          //                 child: Stack(
          //                   children: <Widget>[
          //                     Icon(Icons.brightness_1, //number in circle
          //                         size: 20.0,
          //                         color: Colors.red[700]),
          //                     Positioned(
          //                       top: 3.0,
          //                       right: 7,
          //                       child: Center(
          //                         child: Text(
          //                           cartProvider.count.toString(),
          //                           style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 12.0,
          //                               fontWeight: FontWeight.w500),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         )),
          //   )
          // ],
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
          child: Container(
            child: Column(
              children: [
                // ElevatedButton(
                //   onPressed: () => print(products),
                //   child: Text("Print Products"),
                // ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      FoodDetailPage(products[index]))),
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio: 1.5,
                                    child: Container(
                                      child: Image.network(
                                          products[index]["product-img"]),
                                    )),
                                Text(
                                  "${products[index]["product-name"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "\$ ${products[index]["product-price"].toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}

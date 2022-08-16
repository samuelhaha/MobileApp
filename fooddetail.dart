import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';

class FoodDetailPage extends StatefulWidget {
  // const FoodDetailPage({Key key}) : super(key: key);

  var product;
  FoodDetailPage(this.product);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  List products = [];

  Future addToCart() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("cart");
    return collectionRef.doc(currentUser.email).collection("items").doc().set({
      "name": widget.product["product-name"],
      "price": widget.product["product-price"],
      "image": widget.product["product-img"],
    }).then((value) => print("Added to Cart"));
  }

  Future Favourites() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("favourites");
    return collectionRef.doc(currentUser.email).collection("items").doc().set({
      "name": widget.product["product-name"],
      "price": widget.product["product-price"],
      "image": widget.product["product-img"],
    }).then((value) => print("Added to Favourites"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        actions: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("favourites")
                .doc(FirebaseAuth.instance.currentUser.email)
                .collection("items")
                .where("name", isEqualTo: widget.product['product-name'])
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Text("");
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: () => snapshot.data.docs.length == 0
                          ? Favourites()
                          : print("Already Favourited"),
                      icon: snapshot.data.docs.length == 0
                          ? Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.white,
                            )),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product['product-name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.product['product-description'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Text("\$ ${widget.product['product-price'].toString()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: ElevatedButton(
                onPressed: () => addToCart(),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  elevation: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

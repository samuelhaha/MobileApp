import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/services/firestore_service.dart';

import '../services/firebaseauth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  sendUserDatatoDB() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef
        .doc(currentUser.email)
        // .doc()
        .set({
          "email": emailController.text,
          "password": passwordController.text,
        })
        .then((value) => print("user data added"))
        .catchError((error) => print("something is wrong."));
  }

  bool signUp = true;

  String get email => null;

  String get password => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/foodbackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                sendUserDatatoDB();
                if (signUp) {
                  var newuser = await FirebaseAuthService().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (newuser != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                } else {
                  var reguser = await FirebaseAuthService().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (reguser != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                }
              },
              child: signUp ? Text("SignUp") : Text("Sign In"),
            ),

            //Sign up //sign in toggler
            OutlinedButton(
              onPressed: () {
                setState(() {
                  signUp = !signUp;
                });
              },
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.red),
              child: signUp
                  ? Text("Have an account? Sign In")
                  : Text("Create an account"),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../pages/signup_page.dart';

// class SignInPage extends StatefulWidget{
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage>{

//   Widget _buildEmailTextField(){
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: "Email or username", //Placeholder 1
//         hintStyle: TextStyle(
//           color: Color(0xFFBDC2CB),
//           fontSize: 18.0,
//         ),
//       ),
//     );
//   }

//    Widget _buildPasswordTextField(){
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: "Your Password", //Placeholder 1
//         hintStyle: TextStyle(
//           color: Color(0xFFBDC2CB),
//           fontSize: 18.0,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:<Widget>[
//             Text(
//               "Sign In",
//               style: TextStyle(
//                 fontSize: 40.0,
//                 fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 100.0,), //100 downwards from Sign In
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end, //horizontal -> push to the right (end)
//                 children: <Widget>[
//                   Text("Forgotten Password?", style: TextStyle(fontSize: 18.0, color: Colors.blueAccent, fontWeight: FontWeight.bold,),),
//                 ],
//               ),
//               SizedBox(height: 10.0,), //the white box become longer in height
//               Card(
//                 elevation: 5.0, //shadow
//                 child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Column(
//                     children: <Widget>[
//                       _buildEmailTextField(), //horizontal line 1
//                       SizedBox(height: 20.0,),
//                       _buildPasswordTextField(), //horizontal line 2
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30.0,), //leave space of 20 to go below the Field Box
//               Container(
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),

//                 child: Center(
//                   child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),), //the word "Sign In"

//                 ),

//               ),
//               Divider(height: 20.0,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center, //align the two texts in the middle (horizontal)
//                 children: <Widget>[
//                   Text("Don't have an account?", style: TextStyle(color: Color(0xFFBDC2CB), fontWeight: FontWeight.bold, fontSize: 14.0),),
//                   SizedBox(width: 10.0,), //Leave space of 10
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
//                     },
//                     child: Text("Sign up",
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14.0),),
//                   ),
//                 ],
//               )
//           ]
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/src/homescreen.dart';
// import 'package:flutter_application_1/src/pages/home_page.dart';
// import '../pages/signup_page.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// class SignInPage extends StatefulWidget {
//   const SignInPage({Key key}) : super(key: key);
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();

//   final _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     final emailField = TextFormField(
//       autofocus: false,
//       controller: emailController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (value)
//       {
//         if(value.isEmpty)
//         {
//           return ("Please Enter Your Email");
//         }

//         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
//         {
//           return("Please enter a valid email");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         emailController.text = value;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.mail),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Email",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );

//     final passwordField = TextFormField(
//       autofocus: false,
//       controller: passwordController,
//       obscureText: true, //hide password

//       validator: (value){
//         RegExp regex = new RegExp(r'^.{6,}$'); //6 characters
//         if(value.isEmpty) //if password field is empty
//         {
//           return("Please Enter your password");
//         }
//         if(!regex.hasMatch(value))
//         {
//           return("Please enter Valid Password(Min. 6 Characters)");
//         }
//       },
//       // keyboardType: TextInputType.emailAddress,
//       onSaved: (value) {
//         passwordController.text = value;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Password",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );

//     final loginButton = Material(
//         elevation: 5,
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.blueAccent,
//         child: MaterialButton(
//           padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           onPressed: () {
//             signIn(emailController.text, passwordController.text);
//           },
//           child: Text(
//             "Login",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ));

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                         height: 200,
//                         child: Image.asset(
//                           "assets/images/turkey.png",
//                           fit: BoxFit.contain,
//                         )),
//                     SizedBox(
//                       height: 45,
//                     ),
//                     emailField,
//                     SizedBox(
//                       height: 45,
//                     ),
//                     passwordField,
//                     SizedBox(
//                       height: 45,
//                     ),
//                     loginButton,
//                     SizedBox(
//                       height: 45,
//                     ),

//                     //    GestureDetector(

//                     //   onTap: (){
//                     //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
//                     //   },
//                     //   child: Text("Sign up here!",
//                     //   style: TextStyle(
//                     //     color: Colors.blueAccent,
//                     //     fontWeight: FontWeight.bold,
//                     //     fontSize: 14.0),),
//                     // ),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text("Dont have an account? "),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
//                           },
//                           child: Text(
                         
//                             "Sign Up",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400, fontSize: 15),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void signIn(String email, String password) async {
//     if(_formKey.currentState.validate())
//     {
//       await _auth.signInWithEmailAndPassword(email: email, password: password)
//       .then((uid) => {
//         Fluttertoast.showToast(msg: "Login Successful"),
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()))

//       }).catchError((e)
//       {
//         Fluttertoast.showToast(msg: e.message);
//       }
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';

import '../services/firebaseauth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text('Login Page'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
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
            child: signUp
                ? Text("Have an account? Sign In")
                : Text("Create an account"),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:flutter_application_1/src/services/firebaseauth_service.dart';
// import 'package:flutter_application_1/src/pages/home_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   bool signUp = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Firebase Firestore App'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: "Email",
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: "Password",
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               if (signUp) {
//                 var newuser = await FirebaseAuthService().signUp(
//                   email: emailController.text.trim(),
//                   password: passwordController.text.trim(),
//                 );
//                 if (newuser != null) {
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 }
//               } else {
//                 var reguser = await FirebaseAuthService().signIn(
//                   email: emailController.text.trim(),
//                   password: passwordController.text.trim(),
//                 );
//                 if (reguser != null) {
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 }
//               }
//             },
//             child: signUp ? Text("SignUp") : Text("Sign In"),
//           ),

//           //Sign up //sign in toggler
//           OutlinedButton(
//             onPressed: () {
//               setState(() {
//                 signUp = !signUp;
//               });
//             },
//             child: signUp
//                 ? Text("Have an account? Sign In")
//                 : Text("Create an account"),
//           )
//         ],
//       ),
//     );
//   }
// }


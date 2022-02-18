import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/src/pages/about_page.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/order_page.dart';
import 'package:flutter_application_1/src/pages/profile_page.dart';
import 'package:flutter_application_1/src/pages/signin.page.dart';
import 'package:flutter_application_1/src/pages/drawer.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
  
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Email And Password Login',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
     
//     );
//   }
// }
class MyApp extends StatefulWidget{
   @override
  _MyAppState createState() => _MyAppState();
  
 }

class _MyAppState extends State<MyApp>{
  String title = 'Home';
  int index = 0;
  List<Widget> list = [HomePage(), OrderPage(), AboutPage(), ProfilePage(), LoginPage()];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          
        ),
        // body: HomePage(),
        // drawer: MyDrawer(),
        
        body: list[index],
        drawer: MyDrawer(onTap: (context, i ,txt){
          setState(() {
            index = i;
            title = txt;
            Navigator.popUntil(context, ModalRoute.withName('/'));
            
          });
          
        }),
        
      ),
   
    );

  }
}

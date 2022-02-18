// import 'package:flutter/material.dart';
// import '../pages/home_page.dart';
// import '../pages/order_page.dart';
// import '../pages/about_page.dart';
// import '../pages/profile_page.dart';

// class MainScreen extends StatefulWidget{
//   @override
//   _MainScreenState createState() => _MainScreenState();

// }

// class _MainScreenState extends State<MainScreen>{

//   int currentTabIndex = 0;

//   List<Widget> pages;
//   Widget currentPage;

//   HomePage homePage;
//   OrderPage orderPage;
//   AboutPage aboutPage;
//   ProfilePage profilePage;


//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     homePage = HomePage();
//     orderPage = OrderPage();
//     aboutPage = AboutPage();
//     profilePage = ProfilePage();

//     pages = [homePage, orderPage, aboutPage, profilePage];

//     currentPage = homePage; //current page is home page
//   }

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (int index){
//           setState(() {
//             currentTabIndex = index;
//             currentPage = pages[index];
//           });
//         },
//         currentIndex: currentTabIndex,
//         type: BottomNavigationBarType.fixed,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             // backgroundColor: Color(0xFFE1F5FE),
//             icon: Icon(Icons.home),
//             title: Text("Home")
//             // label: 'home',
//           ),
//           BottomNavigationBarItem(
//             // backgroundColor: Color(0xFFE1F5FE),
//             icon:Icon(Icons.shopping_cart),
//             title:Text("Orders")
//             //  label: 'orders',
//           ),
//            BottomNavigationBarItem(
//             backgroundColor: Color(0xFFE1F5FE),
//             icon:Icon(Icons.favorite_outline_outlined),
//             title:Text("About")
//             // label: 'about',
//           ),
//            BottomNavigationBarItem(
//             backgroundColor: Color(0xFFE1F5FE),
//             icon:Icon(Icons.person),
//             title:Text("Profile")
//             // label: 'profile',
//           ),
//         ],
//       ),
//       body: currentPage,
//     );
//   }
// }
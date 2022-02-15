import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/order_page.dart';
import 'package:flutter_application_1/src/widgets/food_category.dart';
import '../widgets/food_category.dart';
import 'cartprovider.dart';
import 'drawer.dart';
import '../widgets/bought_food.dart';

import '../data/food_data.dart';
import '../models/food_model.dart';

// import 'package:flutter_application_1/CartProvider.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<Food> _foods = foods;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0), //away from top = 50, away from left = 20, away from right = 20 
        children: <Widget>[
          // HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20.0,), //margin between the listview and others (Search Field)
    
          SizedBox(height: 20.0,), //margin between the Search bar and others (Text)
          Row(        //Align Widgets in horizontal order (left to right)
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Frequently bought foods",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: (){},
                  child: Text(
                  "View All",
                   style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,), 
          Column(
            children: _foods.map(_buildFoodItems).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0), //Margin of 20cm (vertical = bottom) between each category of food 
      child: BoughtFoods(
        id: food.id,
        name: food.name,
        imagePath: food.imagePath,
        category: food.category,
        // discount: food.discount,
        price: food.price,
        ratings: food.ratings,
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   final _shoeName = [
//     'Kaptir Super',
//     'Ultra Boost',
//     'Ultra DNA',
//     'Air Force FlyKnit',
//     'Pegasus Trail',
//     'React Infinity'
//   ];

//   final _shoePrice = [
//     '\$128.0',
//     '\$132.0',
//     '\$139.0',
//     '\$205.0',
//     '\$146.0',
//     '\$130.0',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     //Inject Provider Instance

//     var cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ProductPage(Provider)'),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: 150.0,
//               width: 30.0,
//               child: InkWell(
//                 splashColor: Colors.redAccent,
//                 highlightColor: Colors.blueAccent.withOpacity(0.5),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => OrderPage(),
//                     ),
//                   );
//                 },
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       child: Column(),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.shopping_cart,
//                         color: Colors.white,
//                       ),
//                       onPressed: null,
//                     ),
//                     Positioned(
//                       child: Stack(
//                         children: <Widget>[
//                           Icon(Icons.brightness_1,
//                               size: 20.0, color: Colors.red[700]),
//                           Positioned(
//                             top: 3.0,
//                             right: 7,
//                             child: Center(
//                               child: Text(
//                                 cartProvider.count.toString(),
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12.0,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: ListView(
//         children: List.generate(6, (index) {
//           return InkWell(
//             splashColor: Colors.blueAccent,
//             highlightColor: Colors.blueAccent.withOpacity(1.0),
//             onTap: () {
//               cartProvider.addToCart(index);
//             },
//             child: _buildGridCards(index, 'images/shoe${index + 1}.jpg',
//                 _shoeName[index], _shoePrice[index]),
//           );
//         }),
//       ),
//     );
//   }

//   Widget _buildGridCards(
//       int index, String imgPath, String shoeName, String shoePrice) {
//     return Card(
//       color: Colors.lightBlueAccent[50],
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 140,
//               width: 150,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(imgPath),
//                     fit: BoxFit.fitWidth,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 10,
//                         color: Colors.black,
//                         offset: Offset(1, 3))
//                   ]),
//             ),
//           ),
//           Text(
//             shoeName,
//             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             shoePrice,
//             style: TextStyle(fontSize: 14.0),
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.add_circle,
//               color: Colors.black,
//             ),
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }
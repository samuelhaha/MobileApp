import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widgets/food_category.dart';
import 'widgets/food_category.dart';

import 'widgets/bought_food.dart';

import 'data/food_data.dart';
import 'models/food_model.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

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
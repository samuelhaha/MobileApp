import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical:10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color(0xFFD3D3D3)), //Border to be grey
                borderRadius: BorderRadius.circular(10.0), //make it rounder 
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: (){}, //Make the button clickable
                    child: Icon(Icons.keyboard_arrow_up,color: Color(0xFFD3D3D3),), //Press up = number increase by 1
                  ),
                  Text("0", style: TextStyle(fontSize: 18.0),),
                  InkWell(
                    onTap: (){}, //Make the button clickable
                    child: Icon(Icons.keyboard_arrow_down, color: Color(0xFFD3D3D3),), //Press down = number decrease by 1
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.0,), //from the left
            Container(
              height: 70.0, //image height
              width: 70.0, //image width
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/lunch.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0), //circular
                boxShadow: [
                  BoxShadow(
                    color: Colors.black, //black shadow
                    blurRadius: 5.0,
                    offset: Offset(0.0, 5.0), //Offset = move the shadow 
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Grilled Chicken", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),), //Name
                SizedBox(height: 5.0,), //spaces
                Text("3.0", style: TextStyle(color: Colors.orangeAccent, fontSize: 16.0, )), //Price
                SizedBox(height: 5.0,), //spaces
                Container( //size of the box
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal, //horizontal Direction of ListView
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text("Chicken", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                            SizedBox(width: 5.0,),
                            InkWell(
                              onTap: (){}, //Tap the x 
                              child: Text("x", 
                              style: TextStyle(
                                color: Colors.red, 
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){}, //tap the x
              child: Icon(Icons.cancel, color: Colors.grey,) // delete the item from cart by pressing x
            ), 
          ],
        ),
      )
    );
  }
}
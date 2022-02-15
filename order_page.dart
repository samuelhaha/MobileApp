import 'package:flutter/material.dart';
import 'signin.page.dart';
import '../widgets/order_card.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor:Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OrderCard(),
          OrderCard(),
        ],
      ),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 220.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "30",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
         
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Checkout?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import './cartprovider.dart';

// class OrderPage extends StatelessWidget{
//   var Provider;

 
//   OrderPage({Key key}) : super(key: key);
//     @override

//     Widget build(BuildContext context){
 
//     var cartProvider = Provider.of<CartProvider>(context);
//     var cart = cartProvider.cart;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shopping Cart"),
//         actions: [
//           Center(
//             child: Text(
//               'Total: ' + cartProvider.cartCount.toString(),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize:16.0,
//                 fontWeight: FontWeight.w500),
//               ),
//             ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: cart.length,
//         itemBuilder: (context,index){
//           int cartIndex = cart.keys.toList()[index];
//           int count = cart[cartIndex];
//           return ListTile(
//             leading: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 100,
//                 width: 90,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("images/shoe_${cartIndex + 1}.jpg"),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//             ),
//             title: Text('Quantity:$count'),
//             trailing: IconButton(
//               icon: Icon(Icons.clear),
//               onPressed:(){
//                 cartProvider.clear(cartIndex);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
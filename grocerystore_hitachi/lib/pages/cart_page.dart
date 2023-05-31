import 'package:flutter/material.dart';
import 'package:grocerystore_hitachi/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body : Consumer<CArtModel>(builder:(context, value, child) {
        return Column(children: [
          Expanded(child: ListView.builder(
            itemCount: value.cartItems.length,
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  leading: Image.asset(value.cartItems[index][2],height: 34,),
                  title: Text(value.cartItems[index][0]),
                  subtitle: Text('\$' + value.cartItems[index][1]),
                  trailing: IconButton(icon: Icon(Icons.cancel),
                    onPressed: () =>
                        Provider.of<CArtModel>(context, listen: false).removefromcart(index),

                    ),
                ),
              ),
            );
          },
          )
          ),
          Padding(
            padding: const EdgeInsets.all(34.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
              ),

              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Total Price",
                        style: TextStyle(
                            color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold

                        ) ,
                      ),
                      Text('\$' + value.calculateTotal())
                    ],
                  )
                ],
              )
            ),
          )

        ],
        );
      },

      )


    );
  }
}

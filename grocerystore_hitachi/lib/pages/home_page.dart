import 'package:flutter/material.dart';
import 'package:grocerystore_hitachi/components/grocery_items_tile.dart';
import 'package:grocerystore_hitachi/model/cart_model.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
          return CartPage();
        })),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(height: 48),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning"),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                  "Let's order fresh items for you",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(


              ),
            ),

            const SizedBox(height: 24),

            // items for sale + grid
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  "Fresh Items",
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Consumer<CArtModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(20),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.shopItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryitemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () =>
                            Provider.of<CArtModel>(context, listen: false)
                                .additems(index)
                      )
                      ;
                    },
                  );
                },
              ),
            ),





          ],

        ),

    ),
    );
  }
}

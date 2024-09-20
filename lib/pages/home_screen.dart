import 'package:flutter/material.dart';
import 'package:grocery_app/container/grocery_items_grids.dart';
import 'package:grocery_app/model/cart_item_model.dart';
import 'package:grocery_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            // Wish greeting
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Welcome to our Grocery Store",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        
            // let's order fresh items for you
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            const SizedBox(height: 20,),
            // fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Fresh Items",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Consumer<CartItemModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemsGrids(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      itemPicPath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartItemModel>(context, listen: false)
                        .addItemToCart(index);
                      },
                    );
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
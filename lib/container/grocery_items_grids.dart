import 'package:flutter/material.dart';

class GroceryItemsGrids extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPicPath;
  final color;
  void Function()? onPressed;

  GroceryItemsGrids({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPicPath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image
            Image.asset(
              itemPicPath,
              height: 90,
            ),
      
            // item name
            Text(itemName),
      
            // price + button
            MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                "INR  "+itemPrice,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
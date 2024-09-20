import 'package:flutter/material.dart';

class CartItemModel extends ChangeNotifier{
  // list of items on sale
  final List _shopItems = [
    // list of itemName, itemPrice, itemPicPath, color
    ["Avocado", "250", "lib/images/avocado.png", Colors.greenAccent],
    ["Banana", "50", "lib/images/banana.png", Colors.yellow],
    ["Milk", "30", "lib/images/milk.png", Colors.blueGrey],
    ["Nachos", "20", "lib/images/nachos.png", Colors.orangeAccent],
    ["Cooking Oil", "120", "lib/images/cooking-oil.png", Colors.brown],
  ];

  List _cartItems = [];

  // get shopItems
  get shopItems => _shopItems;

  // get cartItems
  get cartItems => _cartItems;

  // add items to the cart
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  } 

  //remove item from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotalPrice(){
    int totalPrice = 0;
    for(int i = 0; i < _cartItems.length; i++){
      totalPrice += int.parse(_cartItems[i][1]);
    }
    return totalPrice.toString();
  }
}
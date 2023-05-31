import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CArtModel extends ChangeNotifier{
  final List _shopItems = [
    ["Pancakes", "10.00","lib/images/pancakes.jpg", Colors.brown],
    ["Fruits", "15.00","lib/images/fruits.png", Colors.yellow],
    ["vegetable", "7.00","lib/images/vegetables.jpg", Colors.green],
    ["buns", "3.00","lib/images/buns.jpg", Colors.orange],

  ];

  List _cartitems = [];

  get shopItems => _shopItems;

  get cartItems => _cartitems;

  void additems(int index){
    _cartitems.add(_shopItems[index]);
    notifyListeners();
  }

  void removefromcart(int index) {
    _cartitems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal(){
    double totalprice = 0;
    for (int i = 0;i<_cartitems.length;i++){
      totalprice += double.parse(_cartitems[i][1]);
    }
    return totalprice.toStringAsFixed(2);
  }

}
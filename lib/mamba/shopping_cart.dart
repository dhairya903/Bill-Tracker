import 'package:flutter/material.dart';
import 'package:bill_tracker/mamba_components/reuseable_card_shoppingcart.dart';
import 'package:bill_tracker/mamba_components/bottom_button.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<int> quantities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Shopping Cart'),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          ReuseableCardShoppingCart(
              description: '1 Liter',
              productName: 'Milk',
              price: '3\$',
              image: 'images/milk.png'),
          ReuseableCardShoppingCart(
              description: '1 Liter',
              productName: 'Milk',
              price: '3\$',
              image: 'images/milk.png'),
          ReuseableCardShoppingCart(
              description: '1 Liter',
              productName: 'Milk',
              price: '3\$',
              image: 'images/milk.png'),
          ReuseableCardShoppingCart(
              description: '1 Liter',
              productName: 'Milk',
              price: '3\$',
              image: 'images/milk.png'),
          ReuseableCardShoppingCart(
              description: '1 Liter',
              productName: 'Milk',
              price: '3\$',
              image: 'images/milk.png'),
          BottomButton(
            onTap: () {},
            buttonTitle: 'Proceed to bill',
          ),
        ],
      ),
    );
  }
}

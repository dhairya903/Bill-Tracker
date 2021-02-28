import 'package:flutter/material.dart';

class ReuseableCardBill extends StatelessWidget {
  final String productName;
  final int quantity;
  final double price;

  const ReuseableCardBill(
      {@required this.productName,
      @required this.quantity,
      @required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150.0,
            child: Text(
              '$productName',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
            width: 50,
            child: Text(
              '$quantity',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
            width: 50,
            child: Text(
              '$price',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

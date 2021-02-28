import 'package:flutter/material.dart';
import 'round_icon_button.dart';

class ReuseableCardShoppingCart extends StatefulWidget {

  final String image;
  final String productName;
  final String price;
  final String description;

  ReuseableCardShoppingCart({@required this.image,@required this.productName,@required this.price,@required this.description});

  @override
  _ReuseableCardShoppingCartState createState() => _ReuseableCardShoppingCartState();
}

class _ReuseableCardShoppingCartState extends State<ReuseableCardShoppingCart> {

  int _quantity=0;

  int getQuantity () {
    return _quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.productName),
              Image(
                image: AssetImage(widget.image),
                color: Colors.white,
                width: 100.0,
                height: 100.0,
              ),
            ],
          ),
          Column(
            children: [
              Text(widget.description),
              Text(widget.price),
              Text(
                '$_quantity',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              Row(
                children: [
                  RoundIconButton(
                    icon: Icons.remove,
                    onPressed: () {
                      setState(() {
                        if (_quantity > 0) {
                          _quantity--;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RoundIconButton(
                    icon: Icons.add,
                    onPressed: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      width: double.infinity,
      height: 175.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: Color(0xFFEB1555),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}

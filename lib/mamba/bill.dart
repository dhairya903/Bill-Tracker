import 'package:firebase_auth/firebase_auth.dart';
import 'package:bill_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:bill_tracker/mamba_components/reuseable_card_bill.dart';
import 'package:bill_tracker/mamba_components/bottom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bill extends StatelessWidget {
  double _amount = 0;

  Bill({this.productName, this.quantity, this.price, this.bill});

  var productName = [];
  var quantity = [];
  var price = [];
  var bill = [];

  String getAmountWithoutGst() {
    for (int i = 0; i < quantity.length; i++) {
      _amount += quantity[i] * price[i];
    }
    return _amount.toStringAsFixed(2);
  }

  String getGst() {
    double gst = _amount * 0.025;
    return gst.toStringAsFixed(2);
  }

  String getFinalAmount() {
    _amount += _amount * 0.05;
    return _amount.toStringAsFixed(2);
  }

  Future pushme() async {
    var user = await FirebaseAuth.instance.currentUser();
    var uid = user.uid;
    String d = getFinalAmount();
    return d;
  }

  @override
  Widget build(BuildContext context) {
    var a = getAmountWithoutGst();
    var b = getGst();
    var c = getFinalAmount();
    pushme();

    var widget = Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total :',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    a,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ADD CGST @2.5% :',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  b,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ADD CGST @2.5% :',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  b,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount :',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    c,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 120.0,
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
    // bill.add(a);
    // bill.add(b);
    // bill.add(c);
    // bill.add(widget);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BILL',
          style: kAppBarText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  width: 100,
                  child: Text(
                    'Product',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  width: 90,
                  child: Text(
                    'Quantity',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  width: 90,
                  child: Text(
                    'Price',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: bill.length,
                itemBuilder: (BuildContext context, int index) {
                  return bill[index];
                }),
            SizedBox(
              height: 30,
            ),
            widget,
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[400],
              ),
              height: 60,
              width: 150,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context, c);
                },
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

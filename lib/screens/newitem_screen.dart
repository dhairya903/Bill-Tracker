import 'package:bill_tracker/get_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bill_tracker/constants.dart';

class NewItem extends StatefulWidget {
  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  var productName;
  var price;
  var quantity;
  var ls = [];

  void sendata() async {
    ls.add(productName);
    ls.add(price);
    ls.add(quantity);
    var user = await FirebaseAuth.instance.currentUser();
    var uid = user.uid;
    // FocusScope.of(context).unfocus();
    // Firestore.instance
    //     .collection('items')
    //     .document('$uid')
    //     .collection('bills')
    //     .add({
    //   'productNames': ob.ls,
    //   'prices': ob.price,
    //   'quantity': ob.quantity,
    // });
    Navigator.pop(context, ls);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Enter New Item',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kCardColor,
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: kNavBarColor,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[100],
                      icon: Icon(
                        Icons.label_important_outline_sharp,
                        color: Colors.blueGrey[100],
                        size: 40,
                      ),
                      hintText: 'Enter Product Name',
                      hintStyle: TextStyle(
                        color: kNavBarColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      productName = value;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kCardColor,
                ),
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: kNavBarColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[100],
                    icon: Icon(
                      Icons.import_export_sharp,
                      color: Colors.blueGrey[100],
                      size: 40,
                    ),
                    hintText: 'Enter Quantity',
                    hintStyle: TextStyle(
                      color: kNavBarColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    quantity = value;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kCardColor,
                ),
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: kNavBarColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[100],
                    icon: Icon(
                      Icons.attach_money_sharp,
                      color: Colors.blueGrey[100],
                      size: 40,
                    ),
                    hintText: 'Enter Price',
                    hintStyle: TextStyle(
                      color: kNavBarColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    price = value;
                  },
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: 150,
                    height: 60,
                    child: FlatButton(
                      textColor: Colors.white,
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                      onPressed: sendata,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:bill_tracker/get_data.dart';
import 'package:bill_tracker/logs.dart';
import 'package:bill_tracker/screens/input_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'mamba_components/round_icon_button.dart';
import 'logs.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String storeName;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                title: Center(
                  child: Text(
                    'BILL TRACKER',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 13.0,
              ),
              Container(
                child: Image.asset(
                  'images/bill1.png',
                  width: 300.0,
                  color: Color(0xFF9a8c98),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                color: Color(0xFF9a8c98),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on_rounded,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      'Haiko',
                      style: kCursiveStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                  child: Center(
                    child: Text(
                      'This is a bill keeping app that allows the user to perform basic functionalities like viewing previous logs of the customers and easily billing goods purchased from the store.',
                      textAlign: TextAlign.center,
                      style: kParagraphTextStyle,
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 20.0)),
              SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundIconButton(
                          icon: Icons.list,
                          onPressed: () async {
                            var user =
                                await FirebaseAuth.instance.currentUser();
                            var uid = user.uid;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReadData(
                                        uid: uid,
                                      )),
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return Logs();
                            //     },
                            //   ),
                            // );
                          }),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Logs'),
                    ],
                  ),
                  Column(
                    children: [
                      RoundIconButton(
                        icon: Icons.shopping_cart_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InputScreen(
                                isadd: true,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('New Bill'),
                    ],
                  ),
                  Column(
                    children: [
                      RoundIconButton(
                        icon: Icons.lock_open,
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Sign Out'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

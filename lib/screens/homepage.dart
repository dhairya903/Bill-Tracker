import 'package:bill_tracker/screens/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bill_tracker/get_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Log Out'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 8,
                      ),
                      Text('View Bills'),
                    ],
                  ),
                ),
                value: 'readata',
              ),
            ],
            onChanged: (itemIdentifier) async {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              } else if (itemIdentifier == 'readata') {
                var user = await FirebaseAuth.instance.currentUser();
                var uid = user.uid;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadData(
                      uid: uid,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Container(),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              height: 40,
              width: 106,
              child: FlatButton(
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
                child: Text(
                  'New Bill',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              height: 40,
              width: 106,
              child: FlatButton(
                onPressed: () async {
                  var user = await FirebaseAuth.instance.currentUser();
                  var uid = user.uid;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReadData(
                              uid: uid,
                            )),
                  );
                },
                child: Text(
                  'Past Bills',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              height: 40,
              width: 106,
              child: FlatButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

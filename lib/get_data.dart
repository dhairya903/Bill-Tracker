import 'package:bill_tracker/constants.dart';
import 'package:bill_tracker/logs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  var uid;
  ReadData({this.uid});
  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  var ls1 = [];
  var ls2 = [];
  var ls3 = [];
  var ls4 = [];
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCardColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGS',style: kAppBarText,),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('items/${widget.uid}/bills')
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final chatDocs = chatSnapshots.data.documents;
            if (chatDocs.length == 0) {
              return ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(
                    'No Data :(',
                  )),
                ],
              );
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              itemCount: chatDocs.length,
              itemBuilder: (ctx, index) => SingleChildScrollView(
                child: Column(
                  children: [
                    // Text('products : ${chatDocs[index]['productNames']}'),
                    // Text('quantity : ${chatDocs[index]['quantity']}'),
                    Center(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'BILL ${index + 1}',
                                  style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: kPrimaryColor,letterSpacing: 1.0),
                                ),
                              ),
                              Logs(
                                ls1: chatDocs[index]['productNames'],
                                ls2: chatDocs[index]['quantity'],
                                index: index,
                                total: chatDocs[index]['total'],
                                ls3: chatDocs[index]['prices'],
                                // total: chatDocs[index]['total'],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
// Text('products : ${chatDocs[index]['productNames']}'),
//                   Text('quantity : ${chatDocs[index]['quantity']}'),

// class ReadData extends StatelessWidget {
//   var uid;

//   ReadData({this.uid});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Read Data'),
//       ),
//       body: StreamBuilder(
//         stream: Firestore.instance.collection('items/$uid/bills').snapshots(),
//         builder: (ctx, chatSnapshots) {
//           if (chatSnapshots.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             final chatDocs = chatSnapshots.data.documents;
//             if (chatDocs.length == 0) {
//               return ListView(
//                 children: [
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Center(
//                       child: Text(
//                     'No Data :(',
//                   )),
//                 ],
//               );
//             }

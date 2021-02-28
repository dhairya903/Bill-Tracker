import 'package:bill_tracker/get_data.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Logs extends StatefulWidget {
  var ls1;
  var ls2;
  var index;
  var total;
  var ls3;
  Logs({this.ls1, this.ls2, this.index, this.total, this.ls3});
  @override
  _LogsState createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  String custName;
  String sls = "";
  String sls1 = "";
  var lss1 = [];
  var lss2 = [];
  var lss3 = [];

  Widget makestring() {
    for (int i = 0; i < widget.ls1.length; i++) {
      sls += widget.ls1[i].toString();

      lss1.add(sls);
      sls = "";
    }
    sls = "";
    for (int i = 0; i < widget.ls1.length; i++) {
      sls += widget.ls2[i].toString();
      lss2.add(sls);
      sls = "";
    }
    sls = "";
    for (int i = 0; i < widget.ls3.length; i++) {
      sls += widget.ls3[i].toString();

      lss3.add(sls);
      sls = "";
    }
    // sls += "Total Amount = ${widget.total}";

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(26, 0, 0, 0),
                          width: 90,
                          child: Text(
                            'Product',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 90,
                        child: Text(
                          'Quantity',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                        width: 90,
                        child: Text(
                          'Price',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                    width: 260.0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 1.0,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    itemCount: lss1.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              '${lss1[index]}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: 50,
                            child: Text(
                              '${lss2[index]}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: 50,
                            child: Text(
                              '${lss3[index]}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      );

                      // return Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('${index + 1}'),
                      //     Text('${lss1[index]}'),
                      //     Text('${lss2[index]}'),
                      //   ],
                      // );
                    },
                  ),
                  // SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: 200,
              child: Center(
                child: Text(
                  'Total = ${widget.total}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            child: makestring(),
            width: double.infinity,
            height: 250.0,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}

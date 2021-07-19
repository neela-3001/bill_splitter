import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: CalcApp(),
    ));

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  int tip = 0;
  int person = 1;
  double amount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.horizontal(),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "TOTTAL PER PERSON",
                      style: TextStyle(
                        color: Colors.lightBlue[100],
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                    Text(
                      "\$124",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.horizontal()),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.blueAccent),
                    decoration: InputDecoration(
                        prefixText: "BILL AMOUNT",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        amount = double.parse(value);
                      } catch (exception) {
                        amount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (person > 1) {
                              person--;
                            } else {}
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: Colors.blueGrey,
                          ),
                          child: Center(
                            child: Text(
                              "BILL SPLITTER",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 50,
                        margin: EdgeInsets.all(02.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0),
                          ),
                        ),
                      ),
                      Text(
                        "$person",
                        style: TextStyle(
                            color: Colors.brown[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              person++;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 50,
                            margin: EdgeInsets.all(02.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.0),
                                color: Colors.orange[100]),
                            child: Center(
                              child: Text("+",
                                  style: TextStyle(
                                      color: Colors.brown[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0)),
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "$tip%",
                        style: TextStyle(
                            color: Colors.brown[90],
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.orange,
                          inactiveColor: Colors.brown[90],
                          divisions: 10,
                          value: tip.toDouble(),
                          onChanged: (double newvalue) {
                            setState(() {
                              tip = newvalue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

calculateTotalPerPerson(double totalTip, double billAmount, int splitBy) {
  var totalPerPerson = (totalTip + billAmount) / splitBy;
  return totalPerPerson;
}

calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
  double totaltip = 0.0;

  if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
  } else {
    totaltip = (billAmount + tipPercentage) / 100;
  }
}

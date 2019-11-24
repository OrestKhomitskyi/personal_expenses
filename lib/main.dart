import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        amount: 25.99, title: 'Zara trousers', id: 't1', date: DateTime.now()),
    Transaction(
        amount: 123.99, title: 'Nike shoes', id: 't2', date: DateTime.now())
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Expenses"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Card(
                    child: Text('CHART!'),
                  )),
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                      ),
                      FlatButton(
                        child: Text('Add transaction'),
                        onPressed: () {},
                        textColor: Colors.purple,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          // width: 85,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2)),
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            "\$ ${tx.amount.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              DateFormat.yMd().add_Hm().format(tx.date),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black38),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ));
  }
}

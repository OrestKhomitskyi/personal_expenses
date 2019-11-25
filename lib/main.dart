import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ccc) {
          return GestureDetector(
            child: NewTransaction(_handleAddNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(
        amount: 25.99,
        title: 'Wednesday grocery',
        id: 't1',
        date: DateTime.now().subtract(Duration(days: 5))),
    // Transaction(
    //     amount: 123.99, title: 'Nike shoes', id: 't2', date: DateTime.now())
  ];

  void _handleAddNewTransaction(
      String titleInput, double amountInput, DateTime chosenDate) {
    final newTx = Transaction(
        date: chosenDate,
        title: titleInput,
        amount: amountInput,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _deleteTransaction(String transactionId) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == transactionId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.amber,
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Opensans'),
                button: TextStyle(color: Colors.white)),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            fontFamily: 'Quicksand'),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              actions: <Widget>[
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _startAddNewTransaction(context);
                    },
                  ),
                )
              ],
              title: Text("Personal Expenses"),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Chart(_recentTransactions),
                  TransactionList(_userTransactions, _deleteTransaction),
                ],
              ),
            ),
            floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () {
                  _startAddNewTransaction(context);
                },
                child: Icon(Icons.add),
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransactionTx;

  TransactionList(this._userTransactions, this._deleteTransactionTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 280,
        child: _userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  final tx = _userTransactions[index];

                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                            child: Text(
                              "\$ ${tx.amount.toStringAsFixed(2)}",
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 20,
                                //color: Theme.of(context).accentColor
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(tx.title,
                          style: Theme.of(context).textTheme.title),
                      subtitle: Text(DateFormat.yMMMd().format(tx.date)),
                      trailing: IconButton(
                        onPressed: () {
                          _deleteTransactionTx(tx.id);
                        },
                        color: Colors.red,
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
                itemCount: _userTransactions.length,
                // _userTransactions.map((tx) {

                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         // width: 85,
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Theme.of(context).primaryColor,
                //                 width: 2)),
                //         padding: EdgeInsets.all(10.0),
                //         margin: EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 15),
                //         child: Text(
                //           "\$ ${tx.amount.toStringAsFixed(2)}",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //               color: Theme.of(context).primaryColor),
                //         ),
                //       ),
                //       Column(
                //         // mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(tx.title,
                //               style: Theme.of(context).textTheme.title),
                //           Text(
                //             DateFormat.yMd().add_Hm().format(tx.date),
                //             style: TextStyle(
                //                 fontSize: 13, color: Colors.black38),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
                // }).toList(),
              ));
  }
}

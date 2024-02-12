// // @dart= 2.8
// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';

// import 'package:realapp/widgets/new_transaction.dart';
// import 'package:realapp/widgets/transaction_list.dart';
// import 'package:realapp/models/transaction.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   _UserTransactionsState createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   // final List<Transaction> _userTransactions = [
//   //   Transaction(
//   //     id: 't1',
//   //     title: 'New Shoes',
//   //     amount: 69.99,
//   //     date: DateTime.now(),
//   //   ),
//   //   Transaction(
//   //     id: 't2',
//   //     title: 'Weekly Groceries',
//   //     amount: 16.53,
//   //     date: DateTime.now(),
//   //   ),
//   // ];

//   // void _addnewTransaction(String txtitle, double txamount) {
//   //   final newTx = Transaction(
//   //     title: txtitle,
//   //     amount: txamount,
//   //     date: DateTime.now(),
//   //     id: DateTime.now().toString(),
//   //   );

//   //   setState(() {
//   //     _userTransactions.add(newTx);
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         NewTransaction(_addnewTransaction),
//         TransactionList(_userTransactions),
//       ],
//     );
//   }
// }

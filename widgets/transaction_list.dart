// @dart= 2.8
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

// import 'package:realapp/models/transaction.dart';
// import 'package:realapp/widgets/user_transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

// here we manage our list of transactions
//*** now we move this to our user_transactions */
  // final List<Transaction> _userTransaction = [
  //   Transaction(
  //     id: 't1',
  //     title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Weekly Groceries',
  //     amount: 16.53,
  //     date: DateTime.now(),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    final mediaQuery = MediaQuery.of(context);
    return
        // Container(
        // height: MediaQuery.of(context).size.height * 0.6,
        // height: 300,
        // this height of 300 is part of the issue with List View
        //ListView does not have a height to control the list, therefore we must wrap this in a container.
        // child:
        transactions.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    const Text(
                      'No transactions added yet!',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 60),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.56,
                        child: Image.asset(
                          'assets/icons/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                );
              })
            // list view has an infinate height.  our expanded wrapper forces the child to
            //take all the avaialble height it can get, and if the child is a ListView,
            // then the container and its child are trying to take all the remaining height.
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionItem(
                      transaction: transactions[index],
                      mediaQuery: mediaQuery,
                      deleteTx: deleteTx);
                  //   return Card(
                  //     child: Row(
                  //       children: <Widget>[
                  //         Container(
                  //           margin: const EdgeInsets.symmetric(
                  //             vertical: 10,
                  //             horizontal: 15,
                  //           ),
                  //           decoration: BoxDecoration(
                  //             // color: Theme.of(context).backgroundColor,
                  //             color: Colors.purple,
                  //             border: Border.all(color: Colors.black, width: 2.0),
                  //           ),
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: Text(
                  //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //             // '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //             // '\$${tx.amount}',
                  //             //string interpolation replaces
                  //             // '\$' + (tx.amount).toString(),
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 20,
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //         ),
                  //         Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: <Widget>[
                  //               Text(
                  //                 // tx.title.toString(),
                  //                 transactions[index].title,
                  //                 textAlign: TextAlign.start,
                  //                 //Style: Theme.of(Context).textTheme.title,
                  //                 style: const TextStyle(fontSize: 15),
                  //               ),
                  //               Text(
                  //                 // DateFormat('yyyy-mm-dd').format(tx.date),

                  //                 // DateFormat.yMMMMd().format(tx.date),
                  //                 DateFormat.yMMMMd()
                  //                     .format(transactions[index].date),
                  //                 textAlign: TextAlign.start,
                  //                 style: const TextStyle(
                  //                     color: Colors.grey, fontSize: 12),
                  //               ),
                  //             ]),
                  //       ],
                  //     ),
                  //     // child: Text((tx.title).toString()),
                  //   );
                  // },
                  //calls build fuction for every itme
                  //SingleChildScrollView(
                  // child:
                  // itemCount: transactions.length,
//number of items  in transactions length.
                  //  Column(
                  // children:
                  // transactions.map((tx) {
                  // children: _userTransaction.map((tx) {
                  // return
                  // Card(
                  //   child: Row(
                  //     children: <Widget>[
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(
                  //           vertical: 10,
                  //           horizontal: 15,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: Colors.purple,
                  //           border: Border.all(color: Colors.black, width: 2.0),
                  //         ),
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: Text(
                  //           '\$${tx.amount}',
                  //           //string interpolation replaces
                  //           // '\$' + (tx.amount).toString(),
                  //           style: const TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //       Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             Text(
                  //               tx.title.toString(),
                  //               textAlign: TextAlign.start,
                  //               style: const TextStyle(fontSize: 15),
                  //             ),
                  //             Text(
                  //               // DateFormat('yyyy-mm-dd').format(tx.date),

                  //               DateFormat.yMMMMd().format(tx.date),
                  //               textAlign: TextAlign.start,
                  //               style:
                  //                   const TextStyle(color: Colors.grey, fontSize: 12),
                  //             ),
                  //           ]),
                  //     ],
                  //   ),
                  //   // child: Text((tx.title).toString()),
                  // )
                },
                itemCount: transactions.length,
                // )
              );
  }
}

// class TransactionItem extends StatelessWidget {
//   const TransactionItem({
//     Key key,
//     @required this.transactions,
//     @required this.mediaQuery,
//     @required this.deleteTx,
//   }) : super(key: key);

//   final List<Transaction> transactions;
//   final MediaQueryData mediaQuery;
//   final Function deleteTx;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       margin: const EdgeInsets.symmetric(
//         vertical: 8,
//         horizontal: 5,
//       ),
//       child: ListTile(
//         leading: CircleAvatar(
//           radius: 30,
//           child: Padding(
//             padding: const EdgeInsets.all(6),
//             child: FittedBox(
//                 child: Text(
//               '\$${transactions[index].amount}',
//               style: Theme.of(context).textTheme.subtitle2,
//             )),
//           ),
//         ),
//         title: Text(
//           transactions[index].title,
//           style: Theme.of(context).textTheme.subtitle2,
//         ),
//         subtitle: Text(
//           DateFormat.yMMMd().format(transactions[index].date),
//           style: Theme.of(context).textTheme.subtitle2,
//         ),
//         trailing: mediaQuery.size.width > 360

//             //         TextButton(
//             //           style: TextButton.styleFrom(primary: Colors.green),
//             ? TextButton.icon(
//                 icon: const Icon(Icons.delete),
//                 label: const Text('Delete'),
//                 onPressed: () => deleteTx(transactions[index].id),
//               )
//             // style: Theme.of(context).textTheme.button))
//             // style:
//             // style: Theme.of(context).textTheme.button,
//             //     // // TextButton.styleFrom(textStyle: b
//             //     // TextButton.styleFrom(
//             //     // primary: Colors.red,
//             //     primary: Colors.transparen t,
//             //     onSurface: Colors.black,
//             //     // textStyle:  Theme.of(context). ,
//             //     backgroundColor: Colors.white))
//             : IconButton(
//                 icon: const Icon(Icons.delete),
//                 color: Theme.of(context).errorColor,
//                 onPressed: () => deleteTx(transactions[index].id),
//                 // onPressed: _deleteTransaction does not work as it requires an argument (String id)
//                 //so we rap this into an anonomous function so we pass a reference to this function
//                 //and within there we have our own function that we call so we can now pass our argument
//               ),
//       ),
//     );
//   }
// }
// .toList(),
// ),
// ),
// );
// }
// }

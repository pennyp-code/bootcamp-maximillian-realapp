// @dart= 2.8
//// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:realapp/widgets/new_transaction.dart';
import 'package:realapp/widgets/transaction_list.dart';
import 'package:realapp/widgets/chart.dart';
// import 'package:realapp/widgets/user_transactions.dart';
// import './widgets/user_transactions.dart';
// import 'package:intl/intl.dart';
//  moved to new_transactions.dart file.
// import 'package:realapp/widgets/new_transactions.dart';
// import 'package:realapp/widgets/transaction_list.dart';
// import 'package:google_fonts/google_fonts.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  // [
  // DeviceOrientation.portraitUp,
  // DeviceOrientation.portraitDown,
  // ],
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        shadowColor: Colors.grey,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.dark().textTheme.copyWith(
              subtitle1: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.pink,
                backgroundColor: Colors.grey,

                // brightness: Brightness.dark,
                // primaryColor: Colors.black,
              ),

              subtitle2: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.pink,
                // backgroundColor: Colors.grey,

                // brightness: Brightness.dark,
                // primaryColor: Colors.black,
              ),

              // bodyText1: const TextStyle(backgroundColor: ),
              headline1: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                // color: Colors.black,
                backgroundColor: Colors.pink,
              ),
              headline2: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.pink,
                backgroundColor: Colors.white,
              ),
              // bodyMedium: const TextStyle(
              //   fontFamily: 'OpenSans',
              //   fontWeight: FontWeight.bold,
              //   fontSize: 15.0,
              //   color: Colors.pink,
              //   backgroundColor: Colors.grey,
              // ),
              // fontFamily: 'OpenSans',
              button: const TextStyle(
                decorationThickness: 15,
                color: Colors.white,
                backgroundColor: Colors.pink,
                decorationColor: Colors.amber,
              ),

              // buttonTheme: const ButtonThemeData(
              //     buttonColor: Colors.pink, textTheme: ButtonTextTheme.accent),
              // primarySwatch: Colors.pink,
              // backgroundColor: Colors.purple,
              // toolbarTextStyle:
              // accenttextTheme(); ThemeData.light().textTheme.copyWith(
              //         titleSmall: const TextStyle(
              //           fontFamily: 'OpenSans',
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
            ),
        // primaryTextTheme: ThemeData.light().textTheme.copyWith(
        //       bodyLarge: const TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontWeight: FontWeight.bold,
        //         fontSize: 12.0,
        //         color: Colors.pink,
        //         // backgroundColor: Colors.grey,

        //         // brightness: Brightness.dark,
        //         // primaryColor: Colors.black,
        //       ),
        //       bodyMedium: const TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontWeight: FontWeight.bold,
        //         fontSize: 12.0,
        //         color: Colors.pink,
        //         // backgroundColor: Colors.grey,

        //         // brightness: Brightness.dark,
        //         // primaryColor: Colors.black,
        //       ),
        //       bodySmall: const TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontWeight: FontWeight.bold,
        //         fontSize: 12.0,
        //         color: Colors.pink,
        //         // backgroundColor: Colors.grey,

        //         // brightness: Brightness.dark,
        //         // primaryColor: Colors.black,
        //       ),
        //       bodyText1: const TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontWeight: FontWeight.bold,
        //         fontSize: 12.0,
        //         color: Colors.pink,
        //         // backgroundColor: Colors.grey,

        //         // brightness: Brightness.dark,
        //         // primaryColor: Colors.black,
        //       ),
        //       bodyText2: const TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontWeight: FontWeight.bold,
        //         fontSize: 12.0,
        //         color: Colors.pink,
        //         // backgroundColor: Colors.grey,

        //         // brightness: Brightness.dark,
        //         // primaryColor: Colors.black,
        //       ),
        // ),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purple,
            elevation: 20),
      ),

      // toolbarTextStyle: ,

      // toolbarTextStyle: on Colors.pink,

      // titleTextStyle: TextTheme();
      // textTheme:
      // ThemeData.light().textTheme.copyWith(
      //       titleSmall: const TextStyle(
      //         fontFamily: 'OpenSans',
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      // ),
      // ),
      // ),
      // ),
      home: MyHomePage(),
    );
  }
}
// we could use a map as per the first app, but here we are
//adding a dummy list, we are creating a new class (transaction.dart)
//to define our transaction.

//this is a list of transactions
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // // final List<Transaction> transactions = [
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transx) {
      return transx.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void _addnewTransaction(
      String txtitle, double txamount, DateTime choosenDate) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
        //returns true if this is the element we want to get rid of.
        // can use the abreviated version _userTransactions.removeWhere((tx) => == id);
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addnewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build() MyHomePageState');
    }
    final mediaQuery = MediaQuery.of(context);
    // double width = MediaQuery.of(context).size.width;
    // print(width);
    // double height = MediaQuery.of(context).size.height - 5;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text(
              'Personal Expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                  //IconButton(
                  // icon: const Icon(Icons.add),
                  // onPressed: () => _startAddNewTransaction(context),
                  // )
                )
              ],
            ),
          )
        : AppBar(
            toolbarTextStyle: const TextStyle(backgroundColor: Colors.amber),
            title: const Text('Personal Expenses App'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              )
            ],
          );

    final txListWidget = Container(
      height: 113,
      // height: (mediaQuery.size.height -
      //         appBar.preferredSize.height -
      //         mediaQuery.padding.top) *
      //     0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    final pageBody = SafeArea(
        child: SingleChildScrollView(
      //SingleChildScrollView can be removed or not.
      child: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Show Chart',
                    style: TextStyle(color: Colors.pink),
                  ),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(_recentTransactions),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.4,
                      child: Chart(
                        _recentTransactions,
                      ),
                    )
                  : txListWidget,
            //  child: Container(
          ],
        ),
      ),
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(child: pageBody, navigationBar: appBar)
        : Scaffold(
            appBar: Platform.isIOS ? CupertinoNavigationBar() : appBar,
            // appBar:
            //  AppBar(
            //   toolbarTextStyle: const TextStyle(backgroundColor: Colors.amber),
            //   title: const Text('Personal Expenses App'),
            // iconTheme: ,
            // actions: <Widget>[
            //   IconButton(
            //     icon: const Icon(Icons.add),
            //     onPressed: () => _startAddNewTransaction(context),
            //   )
            // ],
            // ),
            body: SafeArea(
              child: SingleChildScrollView(
                //SingleChildScrollView can be removed or not.
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      if (isLandscape)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Show Chart',
                              style: TextStyle(color: Colors.pink),
                            ),
                            Switch.adaptive(
                              activeColor: Theme.of(context).accentColor,
                              value: _showChart,
                              onChanged: (val) {
                                setState(() {
                                  _showChart = val;
                                });
                              },
                            ),
                          ],
                        ),
                      if (!isLandscape)
                        Container(
                          height: 180,
                          // height: (mediaQuery.size.height -
                          //         appBar.preferredSize.height -
                          //         mediaQuery.padding.top) *
                          //     0.3,
                          child: Chart(_recentTransactions),
                        ),
                      if (!isLandscape) txListWidget,
                      if (isLandscape)
                        _showChart
                            ? Container(
                                height: (mediaQuery.size.height -
                                        appBar.preferredSize.height -
                                        mediaQuery.padding.top) *
                                    0.4,
                                child: Chart(
                                  _recentTransactions,
                                  // TransactionList(_userTransactions, _deleteTransaction)
                                  // _deleteTransaction
                                ),
                              )
                            :
                            // Container(
                            //   width: double.infinity,
                            //   child: const Card(
                            //     elevation: 5,
                            //     color: Colors.pink,
                            //     // color: Theme.of(context).primaryColorLight,
                            //     // child: Text('chart'),
                            //   ),
                            // ),
                            // Expanded(
                            // child:
                            txListWidget,
                      // Container(
                      //     height: (MediaQuery.of(context).size.height -
                      //             appBar.preferredSize.height -
                      //             MediaQuery.of(context).padding.top) *
                      //         0.7,
                      //     child: TransactionList(
                      //         _userTransactions, _deleteTransaction),
                      //   ),
                      // ),
                      // UserTransactions()
                      // This card is the user input for new transactions.
                      //This is moved to the new_transactions.dart file
                      // replace with:
                      //**** NewTransaction(),
                      // *** cut TransactionList() and add to user_transactions.dart
                      // Card(
                      //   child: Container(
                      //     padding: const EdgeInsets.all(5.0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: <Widget>[
                      //         TextField(
                      //           decoration: const InputDecoration(
                      //             labelText: 'Enter Title',
                      //           ),
                      //           controller: titleController,
                      //           // onChanged: (value) {
                      //           //   titleInput = value;
                      //           // },
                      //         ),
                      //         // ignore: prefer_const_constructors
                      //         TextField(
                      //           decoration: const InputDecoration(labelText: 'Amount'),
                      //           controller: amountController,
                      //           // onChanged: (value) {
                      //           //   amountInput = value;
                      //           // },
                      //         ),
                      //         TextButton(
                      //           style: TextButton.styleFrom(primary: Colors.green),
                      //           child: const Text('Add Transaction'),
                      //           onPressed: () {
                      //             print(titleController.text);
                      //             print(amountController.text);
                      //             // print(titleInput);
                      //             // print(amountInput);
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //replace the column of transaction list with the following as it is a sibling of the other cards.
                      // *** TransactionList(),
                      // *** cut TransactionList() and add to user_transactions.dart
                      // Column(
                      //   children: transactions.map((tx) {
                      //     return Card(
                      //       child: Row(
                      //         children: <Widget>[
                      //           Container(
                      //             margin: EdgeInsets.symmetric(
                      //               vertical: 10,
                      //               horizontal: 15,
                      //             ),
                      //             decoration: BoxDecoration(
                      //               color: Colors.purple,
                      //               border: Border.all(color: Colors.black, width: 2.0),
                      //             ),
                      //             padding: EdgeInsets.all(10.0),
                      //             child: Text(
                      //               '\$${tx.amount}',
                      //               //string interpolation replaces
                      //               // '\$' + (tx.amount).toString(),
                      //               style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 20,
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //           ),
                      //           Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: <Widget>[
                      //                 Text(
                      //                   tx.title.toString(),
                      //                   textAlign: TextAlign.start,
                      //                   style: TextStyle(fontSize: 15),
                      //                 ),
                      //                 Text(
                      //                   // DateFormat('yyyy-mm-dd').format(tx.date),

                      //                   DateFormat.yMMMMd().format(tx.date),
                      //                   textAlign: TextAlign.start,
                      //                   style: TextStyle(color: Colors.grey, fontSize: 12),
                      //                 ),
                      //               ]),
                      //         ],
                      //       ),
                      //       // child: Text((tx.title).toString()),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}

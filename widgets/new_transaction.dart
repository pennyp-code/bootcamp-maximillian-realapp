// @dart= 2.8
// ignore_for_file: avoid_print

//this file creates the new transaction input cards
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realapp/widgets/adaptive_Text_Button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxs;

  const NewTransaction(this.addTxs);

  @override
  _NewTransactionState createState() => _NewTransactionState();
  // State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = (_titleController.text).toString();
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTxs(
      enteredTitle,
      // enteredTitle.toString(),
      enteredAmount,
      _selectedDate,
      // double.parse(amountController.text),
    );

    Navigator.of(context).pop();
    //double.parse converts string to a double.
    // print(titleController.text);
    // print(amountController.text);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          // width: double.infinity,
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: mediaQuery.viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // CupertinoTextField(),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Title',
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) {
                //   titleInput = value;
                // },
              ),
              // ignore: prefer_const_constructors
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                // keyboardType: TextInputType.numberwithoptions(2);
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) {
                //   amountInput = value;
                // },
              ),
              Container(
                height: 70,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Choosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                        style: const TextStyle(color: Colors.pink),
                      ),
                    ),
                    // const Expanded(
                    // child:
                    // Text(
                    //     _selectedDate == null? 'No Date Choosen!' : 'Picked Date:'
                    // ),
                    //     ?
                    //     'No Date Chosen!'
                    //     : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    // // ),
                    // // style: TextStyle(
                    // //   color: Colors.pink,
                    // //   fontWeight: FontWeight.bold,
                    // //
                    // ),
                    // ),

                    // Container(
                    //   // color: Theme.of(context).colorScheme.primary,
                    //   child:
                    // const Text(
                    //   'No Date Choosen',
                    //   // style: Theme.of(context).textTheme.headline1
                    //   style: TextStyle(
                    //     color: Colors.pink,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // ),
                    AdaptiveTextButton('Choose Date', _presentDatePicker)
                    // Platform.isIOS
                    //     ? CupertinoButton(
                    //         // color: Colors.purple,
                    //         child: Text('Choose Date',
                    //             // style: Theme.of(context).textTheme.button),
                    //             style: TextStyle(fontWeight: FontWeight.bold)),
                    //         onPressed: _presentDatePicker,
                    //       )
                    //     : TextButton(
                    //         //  style: Theme.of(context).textTheme.subtitle2,
                    //         //     // style: TextButton.styleFrom(primary: Colors.red),
                    //         child: Text('Choose Date',
                    //             style: Theme.of(context).textTheme.button),
                    //         // style: TextStyle(fontWeight: FontWeight.bold)),
                    //         onPressed: _presentDatePicker,
                    //       ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Transaction',
                    style: Theme.of(context).textTheme.button),
                // child: const Text('Add Transaction',
                //               // style:
                //               style: primary: Colors.blue,
                //               TextButton.styleFrom(textStyle: Theme.of(context).textButtonTheme, color: Colors.backgroundColor.blue)
                //               TextButton.styleFrom(textStyle: Theme.of(context).textThemebutton),
                // ),
                // Theme.of(context).textTheme.button),
                //  TextButton.styleFrom(
                //     textStyle:
                //  Theme.of(context).textTheme.button
                //  ),
                // style: TextButton.styleFrom(primary: Colors.transparent),
                // style: TextButton.styleFrom(
                //     // textStyle: Theme.of(context).textButtonTheme,
                //     // primary: Colors.white,
                //     // onSurface: Colors.white,
                //     // backgroundColor: Colors.pink,
                //     ),
                // style: TextButton.styleFrom(TextButtonTheme.of(context),),

                onPressed: _submitData,
                // addNewTransaction();
                // addTxs(
                //     titleController.text, double.parse(amountController.text));
                // //double.parse converts string to a double.
                // print(titleController.text);
                // print(amountController.text);
                // print(titleInput);
                // print(amountInput);
              ),
              // },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

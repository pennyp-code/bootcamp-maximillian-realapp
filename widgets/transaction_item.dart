import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:realapp/models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    required Key key,
    required this.transaction,
    required this.mediaQuery,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final MediaQueryData mediaQuery;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text(
              '\$${widget.transaction.amount}',
              style: Theme.of(context).textTheme.subtitle2,
            )),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: Theme.of(context).textTheme.subtitle2,
        ),
        trailing: widget.mediaQuery.size.width > 360

            //         TextButton(
            //           style: TextButton.styleFrom(primary: Colors.green),
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                onPressed: () => widget.deleteTx(widget.transaction.id),
              )
            // style: Theme.of(context).textTheme.button))
            // style:
            // style: Theme.of(context).textTheme.button,
            //     // // TextButton.styleFrom(textStyle: b
            //     // TextButton.styleFrom(
            //     // primary: Colors.red,
            //     primary: Colors.transparen t,
            //     onSurface: Colors.black,
            //     // textStyle:  Theme.of(context). ,
            //     backgroundColor: Colors.white))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transaction.id),
                // onPressed: _deleteTransaction does not work as it requires an argument (String id)
                //so we rap this into an anonomous function so we pass a reference to this function
                //and within there we have our own function that we call so we can now pass our argument
              ),
      ),
    );
  }
}

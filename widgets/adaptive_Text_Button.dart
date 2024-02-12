import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  AdaptiveTextButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              // color: Colors.purple,
              child: Text(text,
                  // style: Theme.of(context).textTheme.button),
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: handler,
            )
          : TextButton(
              //  style: Theme.of(context).textTheme.subtitle2,
              //     // style: TextButton.styleFrom(primary: Colors.red),
              child: Text(text, style: Theme.of(context).textTheme.button),
              // style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: handler,
            ),
    );
  }
}

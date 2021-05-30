

import 'package:bots_assessment/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> exitApp(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      backgroundColor: Colors.black,
      title: new Text('Do you want to Exit?',
        style: TextStyle(
            fontSize: width(context) / 25,
            fontWeight: FontWeight.w500,
            color: Colors.white
        ),),
      actions: <Widget>[
        new TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text('No', style: TextStyle(
              color: Colors.white
          ),),
        ),
        new TextButton(
          onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          child: new Text('Yes', style: TextStyle(
              color: Colors.white
          ),),
        ),
      ],
    ),
  ) ??
      false;
}
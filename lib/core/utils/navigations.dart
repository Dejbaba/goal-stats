import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigations{

  static Future<Object> transitTo(BuildContext context, Widget page,
      [PageTransitionType type]) {
    return Navigator.of(context).push(
      PageTransition(
        type: type ?? PageTransitionType.rightToLeft,
        child: page,
      ),
    );
  }

  static Future<Object> replaceAndTransitTo(BuildContext context, Widget page,
      [PageTransitionType type]) {
    return Navigator.of(context).pushReplacement(
      PageTransition(
        type: type ?? PageTransitionType.rightToLeft,
        child: page,
      ),
    );
  }

}
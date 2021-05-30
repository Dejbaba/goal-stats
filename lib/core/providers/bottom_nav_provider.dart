

import 'package:bots_assessment/core/providers/base_model.dart';
import 'package:bots_assessment/ui/views/pages/germany.dart';
import 'package:bots_assessment/ui/views/pages/italy.dart';
import 'package:bots_assessment/ui/views/pages/spain.dart';
import 'package:flutter/material.dart';

class BottomNavProvider extends BaseModel{


  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Widget>  _children = [
    Italy(),
    Spain(),
    Germany()
  ];

  List<Widget> get children => _children;


  onTabTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }


}
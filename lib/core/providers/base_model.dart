


import 'package:bots_assessment/core/enums/viewstate.dart';
import 'package:flutter/material.dart';


class BaseModel extends ChangeNotifier{

  ViewState _state = ViewState.Idle ;
  ViewState get state => _state ;

  ViewState _italianState = ViewState.Idle ;
  ViewState get italianState => _italianState ;

  ViewState _spanishState = ViewState.Idle ;
  ViewState get spanishState => _spanishState ;

  ViewState _germanState = ViewState.Idle ;
  ViewState get germanState => _germanState ;


  void setState(ViewState viewState){
    _state = viewState ;
    notifyListeners() ;
  }

  void setItalianState(ViewState viewState){
    _italianState = viewState ;
    notifyListeners() ;
  }

  void setSpanishState(ViewState viewState){
    _spanishState = viewState ;
    notifyListeners() ;
  }

  void setGermanState(ViewState viewState){
    _germanState = viewState ;
    notifyListeners() ;
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class isVisibleProvider with ChangeNotifier{
  bool _isVisible = false;


  bool get isVisible => _isVisible;

  void panelOpen(){
    _isVisible = true;
    notifyListeners();
  }

  void panelClose(){
    _isVisible = false;
    notifyListeners();
  }
}
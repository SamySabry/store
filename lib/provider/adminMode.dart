import 'package:flutter/material.dart';

class AdminMode extends ChangeNotifier
{
  bool isAdmin=false;
  changeisAdmin(bool value)
  {
    isAdmin=value;
    notifyListeners();
  }
}
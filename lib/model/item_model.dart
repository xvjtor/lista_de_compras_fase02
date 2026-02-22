import 'package:flutter/material.dart';

class Item {
  String itemNome;
  double valorItem;
  bool marcado;
  Color textColor;

  Item({required this.itemNome, required this.valorItem})
    : marcado = false,
      textColor = Colors.black;

  void changeStatus(bool status) {
    marcado = status;
    if (marcado == true) {
      textColor = Colors.grey;
    } else {
      textColor = Colors.black;
    }
  }
}

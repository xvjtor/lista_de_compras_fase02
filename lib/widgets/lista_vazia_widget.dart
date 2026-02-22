import 'package:flutter/material.dart';

Widget listaVazia() {
  return Center(
    child: Column(
      mainAxisAlignment: .center,
      children: [
        Image.asset(
          key: Key("emptyListImage"),
          "assets/images/lista-de-compras.png",
          width: 100,
        ),
        SizedBox(height: 40),
        Text(
          "Crie sua primeira lista\nToque no botão azul",
          style: TextStyle(fontSize: 15),
          textAlign: .center,
        ),
      ],
    ),
  );
}

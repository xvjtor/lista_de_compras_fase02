import 'package:app_lista_de_compras/model/item_model.dart';

class Lista {
  String nomeLista;
  List<Item> itens;

  Lista({required this.nomeLista, List<Item>? itens}) : itens = itens ?? [];

  int get totalItens => itens.length;

  int get totalMarcados => itens.where((item) => item.marcado).length;

  double get progresso =>
     itens.isEmpty ? 0 : totalMarcados / totalItens;
  

  double get valorMarcados {
    double total = 0;

    for (var item in itens) {
      if (item.marcado) {
        total += item.valorItem;
      }
    }
    return total;
  }

  double get valorNaoMarcados {
    double total = 0;
    for (var item in itens) {
      if (!item.marcado) {
        total += item.valorItem;
      }
    }
    return total;
  }
}

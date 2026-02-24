import 'package:app_lista_de_compras/model/lista_model.dart';
import 'package:app_lista_de_compras/pages/lista_detalhes_page.dart';
import 'package:flutter/material.dart';

class ListaHomeWidget extends StatefulWidget {
  final List<Lista> lista;
  const ListaHomeWidget({super.key, required this.lista});

  @override
  State<ListaHomeWidget> createState() => _ListaHomeWidgetState();
}

class _ListaHomeWidgetState extends State<ListaHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lista.length,
      itemBuilder: (context, index) {
        final lista = widget.lista[index];

        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Card(
            key: Key("shoppingListCard"),
            margin: .symmetric(horizontal: 1),
            shape: RoundedRectangleBorder(borderRadius: .circular(5)),
            color: Colors.white,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(lista.nomeLista),

                    Text(
                      "${lista.totalMarcados}/${lista.totalItens}",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      color: Colors.green,
                      value: lista.progresso,
                      backgroundColor: Colors.grey[500],
                    ),
                  ],
                ),
              ),
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListaDetalhesPage(lista: lista),
                  ),
                );
                setState(() {});
              },
              shape: RoundedRectangleBorder(borderRadius: .circular(5)),
            ),
          ),
        );
      },
    );
  }
}

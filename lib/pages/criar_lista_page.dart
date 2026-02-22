import 'package:app_lista_de_compras/model/lista_model.dart';
import 'package:app_lista_de_compras/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class CriarListaPage extends StatefulWidget {
  const CriarListaPage({super.key});

  @override
  State<CriarListaPage> createState() => _CriarListaPageState();
}

class _CriarListaPageState extends State<CriarListaPage> {
  void criarLista() {
    if (nomeListaController.text.trim().isEmpty) return;

    final novalista = Lista(nomeLista: nomeListaController.text);
    Navigator.of(context).pop(novalista);
  }

  final nomeListaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Flexible(
              flex: 10,
              child: Align(
                alignment: .center,
                child: TextfieldWidget(
                  key: Key("listNameInput"),
                  text: "Nome da lista",
                  controller: nomeListaController,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Expanded(
                child: Align(
                  alignment: .bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton(
                            key: Key("backToListsBtn"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                            ),
                            child: Text(
                              "Voltar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton(
                            key: Key("createListBtn"),
                            onPressed: () {
                              criarLista();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.white),
                            ),
                            child: Text(
                              "Criar",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

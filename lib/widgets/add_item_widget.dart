import 'package:app_lista_de_compras/model/item_model.dart';
import 'package:app_lista_de_compras/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class AddItemWidget extends StatefulWidget {
  const AddItemWidget({super.key});

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final nomeItemController = TextEditingController();
  final valorItemController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addItem() {
    if (!formKey.currentState!.validate()) return;

    final item = Item(
      itemNome: nomeItemController.text,
      valorItem: double.tryParse(valorItemController.text) ?? 0.0,
    );

    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Adicionar item",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 2),
            SizedBox(height: 15),
            TextfieldWidget(
              key: Key("inputItem"),
              text: "Nome do item",
              controller: nomeItemController,
            ),
            SizedBox(height: 10),
            TextfieldWidget(
              key: Key("inputValue"),
              text: "R\$ 0,00",
              controller: valorItemController,
              teclado: .numberWithOptions(decimal: true),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    addItem();
                  },
                  child: Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

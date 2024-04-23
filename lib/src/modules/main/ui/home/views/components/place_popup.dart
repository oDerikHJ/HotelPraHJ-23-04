import 'package:flutter/material.dart';

class PlacePopup extends StatelessWidget {
  const PlacePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filtros Gerais'),
      content: const TextField(
        decoration: InputDecoration(
          hintText: 'Digite aqui...',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fecha o popup
          },
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}

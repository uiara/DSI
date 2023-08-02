import 'package:flutter/material.dart';

class CadastroPaciente extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Novo Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              key: const Key('nome'),
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 10),
            TextField(
              key: const Key('idade'),
              controller: idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              key: const Key('altura'),
              controller: alturaController,
              decoration: InputDecoration(labelText: 'Altura'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final nome = nomeController.text;
                final idade = int.tryParse(idadeController.text) ?? 0;
                final altura = double.tryParse(alturaController.text) ?? 0;

                final novoPaciente = {'nome': nome, 'idade': idade, 'altura': altura};

                Navigator.pop(context, novoPaciente);
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
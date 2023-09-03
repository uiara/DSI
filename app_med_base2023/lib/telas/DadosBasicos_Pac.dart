import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';
import 'package:app_med_base2023/telas/TelaDados_doPaciente.dart'; // Importe a tela de dados complexos

class NovoPac extends StatefulWidget {
  @override
  _NovoPacState createState() => _NovoPacState();
}

class _NovoPacState extends State<NovoPac> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _salvarDadosPaciente() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        DocumentReference pacienteRef = await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('pacientes')
            .add({
          'nome': _nomeController.text,
          'idade': int.tryParse(_idadeController.text) ?? 0,
          'altura': double.tryParse(_alturaController.text) ?? 0.0,
        });

        print('Paciente salvo com ID: ${pacienteRef.id}');

        // Após salvar os dados básicos, navegue para a tela de dados complexos
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DadosP(pacienteId: pacienteRef.id), // Passe o pacienteId aqui
          ),
        );
      } catch (e) {
        print('Erro ao salvar dados do paciente: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'images/equipe-medica 2.png',
                  width: 52,
                  height: 46,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  'images/hospt.png',
                  width: 200,
                  height: 120,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  'images/image 1.png',
                  width: 213,
                  height: 62,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Nome:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade200,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            controller: _nomeController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Idade:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade200,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            controller: _idadeController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Altura:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade200,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            controller: _alturaController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PerfilMed()),
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'images/Botao_voltar.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    _salvarDadosPaciente();
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'images/Botao_proximo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}

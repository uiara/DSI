import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';

class DadosP extends StatefulWidget {
  final String pacienteId; // Recebe a ID do paciente da tela anterior

  DadosP({required this.pacienteId});

  @override
  _DadosPState createState() => _DadosPState();
}

class _DadosPState extends State<DadosP> {
  bool possuiProblemaCardiaco = false;
  TextEditingController _saturacaoOxigenioController = TextEditingController();
  TextEditingController _frequenciaCardiacaController = TextEditingController();
  TextEditingController _maiorConcentracaoGlicoseController =
      TextEditingController();
  TextEditingController _menorConcentracaoGlicoseController =
      TextEditingController();
  TextEditingController _notasPacienteController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _salvarDadosPaciente() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('pacientes')
            .doc(widget.pacienteId) // Use a ID do paciente
            .update({
          'saturacaoOxigenio':
              double.tryParse(_saturacaoOxigenioController.text) ?? 0.0,
          'frequenciaCardiaca':
              int.tryParse(_frequenciaCardiacaController.text) ?? 0,
          'maiorConcentracaoGlicose':
              double.tryParse(_maiorConcentracaoGlicoseController.text) ?? 0.0,
          'menorConcentracaoGlicose':
              double.tryParse(_menorConcentracaoGlicoseController.text) ?? 0.0,
          'notasPaciente': _notasPacienteController.text,
        });

        // Navegar de volta para a tela anterior após salvar
        Navigator.pop(context);
      } catch (e) {
        print('Erro ao salvar dados complexos do paciente: $e');
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'O paciente teve que ser intubado?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  value: possuiProblemaCardiaco,
                  onChanged: (value) {
                    setState(() {
                      possuiProblemaCardiaco = value!;
                    });
                  },
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                ),
                Text(
                  "Sim",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Checkbox(
                  value: !possuiProblemaCardiaco,
                  onChanged: (value) {
                    setState(() {
                      possuiProblemaCardiaco = !value!;
                    });
                  },
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                ),
                Text(
                  "Não",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Qual foi a menor saturação periférica de oxigênio do paciente que foi registrada durante as primeiras 24 horas de permanência na unidade? ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade200,
                ),
                child: TextField(
                  controller: _saturacaoOxigenioController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      height: 0.8,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '%',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Qual foi a frequência cardíaca mais alta do paciente durante a primeira hora de permanência na unidade?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade200,
                ),
                child: TextField(
                  controller: _frequenciaCardiacaController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      height: 0.8,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'bpm',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Qual foi a maior concentração de glicose do paciente em seu soro ou plasma durante as primeiras 24 horas de permanência na unidade?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade200,
                ),
                child: TextField(
                  controller: _maiorConcentracaoGlicoseController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      height: 0.8,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'mg/dL',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Qual foi a menor concentração de glicose do paciente em seu soro ou plasma durante as primeiras 24 horas de permanência na unidade?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 150,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade200,
                ),
                child: TextField(
                  controller:
                      _menorConcentracaoGlicoseController, // Use o TextEditingController criado
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      height: 0.8,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Container(
                      width: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'mg/dL',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Notas do Paciente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 800, // Você pode ajustar o tamanho conforme necessário
                height: 200, // Você pode ajustar o tamanho conforme necessário
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade200,
                ),
                child: TextField(
                  controller: _notasPacienteController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:
                        18, // Você pode ajustar o tamanho da fonte conforme necessário
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: null, // Permite várias linhas de texto
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Chame o método para salvar os dados complexos
                      _salvarDadosPaciente();
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

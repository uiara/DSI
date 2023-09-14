import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';
import 'package:app_med_base2023/telas/Perf_Paciente.dart';
import 'package:app_med_base2023/telas/DadosBasicos_Pac.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  final String nome;
  final int idade;
  final double altura;
  final double saturacaoOxigenio;
  final int frequenciaCardiaca;
  final double maiorConcentracaoGlicose;
  final double menorConcentracaoGlicose;
  final String imageAsset;
  final String notasPaciente;

  Patient(
    this.nome,
    this.idade,
    this.altura,
    this.saturacaoOxigenio,
    this.frequenciaCardiaca,
    this.maiorConcentracaoGlicose,
    this.menorConcentracaoGlicose,
    this.imageAsset,
    this.notasPaciente,
  );
}

class PacMedico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientListScreen(),
    );
  }
}

class PatientListScreen extends StatefulWidget {
  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Patient> patients = [];

  @override
  void initState() {
    super.initState();
    _fetchPatientsData();
  }

  Future<void> _fetchPatientsData() async {
    List<Patient> fetchedPatients = await _fetchPatients();
    setState(() {
      patients = fetchedPatients;
    });
  }

  Future<List<Patient>> _fetchPatients() async {
    User? user = _auth.currentUser;
    List<Patient> patients = [];

    if (user != null) {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('pacientes')
          .get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        patients.add(Patient(
          data['nome'],
          data['idade'],
          data['altura'],
          data['saturacaoOxigenio'] ?? 0.0,
          data['frequenciaCardiaca'] ?? 0,
          data['maiorConcentracaoGlicose'] ?? 0.0,
          data['menorConcentracaoGlicose'] ?? 0.0,
          'images/paciente 1.png',
          data['notasPaciente'] ?? '',
        ));
      });
    }

    return patients;
  }

  Future<void> _deletarPaciente(Patient patient) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('pacientes')
            .doc() // Use o ID correto do documento que deseja excluir
            .delete();

        // Atualize a lista de pacientes após a exclusão
        patients.remove(patient);
        setState(() {});
      } catch (error) {
        // Trate erros de exclusão, se necessário
        print('Erro ao deletar o paciente: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: patients.length,
                    itemBuilder: (context, index) {
                      final patient = patients[index];
                      return ExpansionTile(
                        title: Row(
                          children: [
                            Container(
                              width: 97,
                              height: 97,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(patient.imageAsset),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nome: ${patient.nome}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Idade: ${patient.idade}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Altura: ${patient.altura.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Saturação de oxigênio: ${patient.saturacaoOxigenio != null ? patient.saturacaoOxigenio.toStringAsFixed(2) : 'N/A'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: (patient.saturacaoOxigenio != null)
                                      ? (patient.saturacaoOxigenio > 105)
                                          ? Colors.red
                                          : (patient.saturacaoOxigenio >= 93 &&
                                                  patient.saturacaoOxigenio <=
                                                      105)
                                              ? Colors.blue
                                              : Colors.orange
                                      : Colors
                                          .black, // Cor padrão se o valor for nulo
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                'Frequência cardíaca: ${patient.frequenciaCardiaca != null ? patient.frequenciaCardiaca.toStringAsFixed(2) : 'N/A'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: (patient.frequenciaCardiaca != null)
                                      ? (patient.frequenciaCardiaca > 100)
                                          ? Colors.red
                                          : (patient.frequenciaCardiaca >= 60 &&
                                                  patient.frequenciaCardiaca <=
                                                      100)
                                              ? Colors.blue
                                              : Colors.orange
                                      : Colors
                                          .black, // Cor padrão se o valor for nulo
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                'Maior conc. de glicose: ${patient.maiorConcentracaoGlicose != null ? patient.maiorConcentracaoGlicose.toStringAsFixed(2) : 'N/A'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: (patient.maiorConcentracaoGlicose !=
                                          null)
                                      ? (patient.maiorConcentracaoGlicose > 180)
                                          ? Colors.red
                                          : (patient.maiorConcentracaoGlicose >=
                                                      140 &&
                                                  patient.maiorConcentracaoGlicose <=
                                                      180)
                                              ? Colors.blue
                                              : Colors.orange
                                      : Colors
                                          .black, // Cor padrão se o valor for nulo
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                'Menor conc. de glicose: ${patient.menorConcentracaoGlicose != null ? patient.menorConcentracaoGlicose.toStringAsFixed(2) : 'N/A'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: (patient.menorConcentracaoGlicose !=
                                          null)
                                      ? (patient.menorConcentracaoGlicose > 100)
                                          ? Colors.red
                                          : (patient.menorConcentracaoGlicose >=
                                                      70 &&
                                                  patient.menorConcentracaoGlicose <=
                                                      100)
                                              ? Colors.blue
                                              : Colors.orange
                                      : Colors
                                          .black, // Cor padrão se o valor for nulo
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                'Notas: ${patient.notasPaciente}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Cor para as notas
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: () => _deletarPaciente(patient),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: Text('Deletar'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        'images/sairbotao.png',
                        width: 150,
                        height: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NovoPac()),
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'images/Botao_cadastrar_novo_paciente.png',
                        width: 270,
                        height: 57,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(PacMedico());

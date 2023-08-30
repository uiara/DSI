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
  final String imageAsset;

  Patient(this.nome, this.idade, this.altura, this.imageAsset);
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
          'images/paciente 1.png', // Use the desired image
        ));
      });
    }

    return patients;
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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PerfPac()),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Row(
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nome: ${patient.nome}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Idade: ${patient.idade}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Altura: ${patient.altura.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
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

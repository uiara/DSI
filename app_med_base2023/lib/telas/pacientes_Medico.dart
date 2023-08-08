import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';
import 'package:app_med_base2023/telas/Perf_Paciente.dart';
import 'package:app_med_base2023/telas/DadosBasicos_Pac.dart';

class PacMedico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientListScreen(),
    );
  }
}

class Patient {
  final String nome;
  final int idade;
  final double altura;
  final String imageAsset;

  Patient(this.nome, this.idade, this.altura, this.imageAsset);
}

class PatientListScreen extends StatelessWidget {
  final List<Patient> patients = [
    Patient('João', 30, 1.75, 'images/paciente 1.png'),
    Patient('Maria', 25, 1.60, 'images/paciente 1.png'),
    Patient('Pedro', 40, 1.80, 'images/paciente 1.png'),
    Patient('flavio', 30, 1.75, 'images/paciente 1.png'),
    Patient('tonho', 25, 1.60, 'images/paciente 1.png'),
    Patient('vitor', 40, 1.80, 'images/paciente 1.png'),
    Patient('carlos', 30, 1.75, 'images/paciente 1.png'),
    Patient('bruno', 25, 1.60, 'images/paciente 1.png'),
    Patient('marcia', 40, 1.80, 'images/paciente 1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Stack(
          children: [
            SingleChildScrollView(
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
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PerfilMed()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Image.asset(
                          'images/sairbotao.png',
                          width: 270,
                          height: 57,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NovoPac()),
                        );
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15), // Ajuste de espaço
                        child: Image.asset(
                          'images/Botao_cadastrar_novo_paciente.png', // Substitua pelo caminho da sua imagem
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
      ),
    );
  }
}

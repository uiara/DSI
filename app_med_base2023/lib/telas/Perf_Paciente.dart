import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';
import 'package:app_med_base2023/telas/resultados.dart';

class PerfPac extends StatelessWidget {
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
                            MaterialPageRoute(
                                builder: (context) => PerfilMed()),
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
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Idade: ${patient.idade}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Altura: ${patient.altura.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20,
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
                  SizedBox(height: 40),
                  Text(
                    'IMC : Indice de massa corporal ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF0B99FF),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'spO2 : Saturação de Oxigênio máxima e mínima',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF0B99FF),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'arf_pache : Se o paciente teve insuficiência renal aguda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF0B99FF),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Frequência Cardíaca : Batimentos por minuto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF0B99FF),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Pressão Arterial : Força que o sangue flui nas artérias',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF0B99FF),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'subdiagnóstico APACHE III-J que melhor descreve o motivo da admissão na UTI:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF0B99FF),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 800),
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
                  SizedBox(height: 120),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Result()),
                        );
                      },
                      child: Text(
                        '"Resultados desse paciente"',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

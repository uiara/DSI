import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/home_page.dart';
import 'package:app_med_base2023/telas/pacientes_Medico.dart';
import 'package:app_med_base2023/telas/resultados.dart';

class PerfilMed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'images/perfilM.png',
                width: 97,
                height: 97,
              ),
            ),
            SizedBox(height: 0),
            Text(
              'Teste de José de Melo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 90),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PacMedico(),
                    ),
                  );
              },
            
              child: Image.asset(
                'images/BTpacientes.png',
                width: 260,
                height: 46,
              ),
            ),
            SizedBox(height: 53),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(),
                  ),
                );
              },
            
              child: Image.asset(
                'images/BTresultados.png',
                width: 260,
                height: 46,
              ),
            ),
            SizedBox(height: 53),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              
              child: Image.asset(
                'images/BTsair.png',
                width: 260,
                height: 46,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
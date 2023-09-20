import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/login_medico.dart';
import 'package:app_med_base2023/telas/tela_sobre.dart';
import 'package:app_med_base2023/main_first_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 45, top: 70),
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      child: Image.asset('images/hospital1.png'),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    child: Container(
                      child: Image.asset('images/image 1.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 120),
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SouMedico(),
                        ),
                      );
                    },
                    child: Image.asset('images/equipe-medica 3.png'),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 95,
                    child: Text(
                      'Sou médico',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),

            SizedBox(height: 20), // Espaço para separar o botão abaixo.
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainPage(title: ''),
                ));
              },
              child: Text('Quero apenas registrar uma consulta'),
            ),
          ],
        ),
      ),
    );
  }
}

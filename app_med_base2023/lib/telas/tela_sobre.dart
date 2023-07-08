import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/home_page.dart';

class SobrE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 105),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/hospt.png',
                  width: 200,
                  height: 120,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.001, left: 95),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/image 1.png',
                  width: 213,
                  height: 62,
                ),
              ],
            ),
          ),
          
          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Container(
              color: Colors.grey[800],
              height: 480,
              padding: EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'O software MedBase visa aprimorar a eficiência e a qualidade dos cuidados médicos, '
                    'além de promover a gestão eficaz das informações clínicas. Criado pelos desenvolvedores '
                    'para uma cadeira da faculdade, o software é feito inteiramente no Flutter e utilizará um '
                    'database escolhido no Kaggle e fará uso de machine learning em uma de suas features para '
                    'a previsão de mortalidade de pacientes.',
                    style: TextStyle(fontSize: 16,
                    fontStyle: FontStyle.normal,
                    height: 1.2,
                    color: Colors.grey[200]),
                    textAlign: TextAlign.justify,
                    
                    
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Voltar', style: TextStyle(fontSize: 22, height: 1.5)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  side: BorderSide(color: Colors.blue, width: 2),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
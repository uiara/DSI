

import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';


class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 16),
            child: Image.asset(
              'images/equipe-medica 2.png',
              width: 52,
              height: 46,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.001, left: 115),
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
          SizedBox(height: 22),
          Align(
              alignment: Alignment.center,  
            child:Text(
              'RESULTADOS',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: 2),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 50, left: 60),
                child: Stack(
                  children: [
                    InkWell(
                        
                      child: Image.asset('images/imgResultados.png'),
                    ),
                      
                  ],
                ),
              ),
            ],
          ),        
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PerfilMed()),
                  );
                },
                child: Text(
                'Voltar',
                style: TextStyle(
                  fontSize: 22,
                  height: 1.5,
                ),
              ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  side: BorderSide(color: Colors.blue, width: 2.5),
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




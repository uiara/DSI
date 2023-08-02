import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';
import 'package:app_med_base2023/telas/TelaDados_doPaciente.dart';
class NovoPac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 16),
            child: Image.asset(
              'images/equipe-medica 2.png',
              width: 52,
              height: 46,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.001, left: 105),
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
            padding: const EdgeInsets.only(top: 0.001, left: 90),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Row(
                    children: [
                    
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Nome:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 80),
                      Container(
                        width: 190,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[500],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 1), 
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            
                        
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                     
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Idade:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 65, width: 110),
                      Container(
                        width: 130, 
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[500],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            
                            
                           
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                    
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Altura:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 46, width: 105),
                      Container(
                        width: 130,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[500],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            
                           
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DadosP()),
                    );
                  
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
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ],
      ),
    );
  }
}
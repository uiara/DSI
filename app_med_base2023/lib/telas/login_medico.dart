import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/home_page.dart';
import 'package:app_med_base2023/telas/esqueceu_senha.dart';
import 'package:app_med_base2023/telas/cadastro_medico.dart';

class SouMedico extends StatelessWidget {
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
                  Container(
                    width: 260,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[500],
                      boxShadow: [
                        BoxShadow(color: Colors.transparent),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,),
                          child: Image.asset(
                            'images/assistencia-medica 1.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'Exemplo@gmail.com',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 1.5,
                              ),
                              filled: true,
                              fillColor: Colors.blue[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    width: 260,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[500],
                      boxShadow: [
                        BoxShadow(color: Colors.transparent),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            'images/senha 1.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'Exemplo1234',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 1.5,
                              ),
                              filled: true,
                              fillColor: Colors.blue[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 45),
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
                child: Text(
                'Entrar',
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
          SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EsqueceuSenha()),
                );
              },
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Não possui cadastro? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadMedico()),
                  );
                },
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

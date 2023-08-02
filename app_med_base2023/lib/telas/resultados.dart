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
            padding: const EdgeInsets.only(top: 50, left: 16),
            child: Image.asset(
              'images/equipe-medica 2.png',
              height: 46,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.001, left: 115),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/hospt.png', // faz o mesmo procedimento da imagem anterior, // essa imagem tem que ser adicionada na pasta images, e tambem deve ser adicionada ao pubspec.yalm dai tu atualiza e ela vai aparecer na execução
                  width: 200,
                  height: 120,
                ),
              ],
            ),
          ),
          SizedBox(height: 22),
          Align(
            alignment: Alignment.center,
            child: Text(
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
                      child: Image.asset(
                          'images/imgResultados.png'), // faz a mesma coisa das imagens anteriores, copia do jeito que ta o caminhao(images/imgResultados.png) pra colar no pubspec
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 94),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PerfilMed()), //aqui é a rota pra quando clicar em voltar
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

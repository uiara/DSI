import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/esqueceu_senha.dart';
import 'package:app_med_base2023/telas/cadastro_medico.dart';
import 'package:app_med_base2023/telas/perfil_Medico.dart';

class SouMedico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Image.asset(
              'images/equipe-medica 2.png',
              width: 52,
              height: 46,
            ),
            SizedBox(height: 30),
            Image.asset(
              'images/hospt.png',
              width: 200,
              height: 120,
            ),
            SizedBox(height: 30),
            Image.asset(
              'images/image 1.png',
              width: 213,
              height: 62,
            ),
            SizedBox(height: 60),
            EmailTextField(),
            SizedBox(height: 20),
            PasswordTextField(),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilMed()),
                );
              },
              child: Text('Entrar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
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
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não possui cadastro? ',
                  style: TextStyle(
                    fontSize: 12,
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
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[500],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.blue[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[500],
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
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.blue[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

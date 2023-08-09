import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/login_Medico.dart';

class CadMedico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 58, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              SizedBox(height: 40),
              _TextField(label: 'Nome Completo'),
              SizedBox(height: 13),
              _TextField(label: 'Endereço de Email'),
              SizedBox(height: 13),
              _TextField(label: 'Tipo Profissional'),
              SizedBox(height: 13),
              _TextField(label: 'Hospital que trabalha'),
              SizedBox(height: 13),
              _TextField(label: 'Número CRM'),
              SizedBox(height: 13),
              _TextField(label: 'Senha', isPassword: true),
              SizedBox(height: 13),
              _TextField(label: 'Confirmar Senha', isPassword: true),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _CustomButton(
                    imagePath: 'images/Bcadastrar.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SouMedico()),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  _CustomButton(
                    imagePath: 'images/Bvoltar4.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SouMedico()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'images/arquivomedico 1.png',
          width: 80,
          height: 100,
        ),
        Flexible(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(
                'Por favor preencha os campos com as informações corretas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF2c2b2b),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const _TextField({
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + ':',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Container(
          width: 334,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xFF0B99FF),
          ),
          child: TextField(
            textAlign: TextAlign.center,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: label,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              alignLabelWithHint: true,
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const _CustomButton({
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        width: 30,
        height: 50,
      ),
    );
  }
}

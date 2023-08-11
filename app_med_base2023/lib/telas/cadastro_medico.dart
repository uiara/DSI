import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/login_Medico.dart';

void main() {
  runApp(CadMedico());
}

class CadMedico extends StatefulWidget {
  @override
  _CadMedicoState createState() => _CadMedicoState();
}

class _CadMedicoState extends State<CadMedico> {
  bool showErrorText = false;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _professionalTypeController = TextEditingController();
  TextEditingController _hospitalController = TextEditingController();
  TextEditingController _crmController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Header(),
                  if (showErrorText) ...[
                    SizedBox(height: 10),
                    Text(
                      'Por favor preencha todos os campos.',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  SizedBox(height: 40),
                  _centeredTextField(
                      controller: _fullNameController, label: 'Nome Completo'),
                  SizedBox(height: 13),
                  _centeredTextField(
                      controller: _emailController, label: 'Endereço de Email'),
                  SizedBox(height: 13),
                  _centeredTextField(
                      controller: _professionalTypeController,
                      label: 'Tipo Profissional'),
                  SizedBox(height: 13),
                  _centeredTextField(
                      controller: _hospitalController,
                      label: 'Hospital que trabalha'),
                  SizedBox(height: 13),
                  _centeredTextField(
                      controller: _crmController, label: 'Número CRM'),
                  SizedBox(height: 13),
                  _centeredTextField(
                      controller: _passwordController,
                      label: 'Senha',
                      isPassword: true),
                  SizedBox(height: 13),
                  _centeredTextField(
                      controller: _confirmPasswordController,
                      label: 'Confirmar Senha',
                      isPassword: true),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _CustomButton(
                        imagePath: 'images/Bcadastrar.png',
                        onTap: () {
                          bool anyFieldEmpty = false;
                          if (_fullNameController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _professionalTypeController.text.isEmpty ||
                              _hospitalController.text.isEmpty ||
                              _crmController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _confirmPasswordController.text.isEmpty) {
                            anyFieldEmpty = true;
                          }

                          if (anyFieldEmpty) {
                            setState(() {
                              showErrorText = true;
                            });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SouMedico()),
                            );
                          }
                        },
                      ),
                      SizedBox(width: 10),
                      _CustomButton(
                        imagePath: 'images/Bvoltar4.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SouMedico()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/arquivomedico 1.png',
          width: 80,
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
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
      ],
    );
  }
}

class _centeredTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;

  const _centeredTextField({
    required this.controller,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label + ':',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 334,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xFF0B99FF),
          ),
          child: TextField(
            controller: controller,
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
        width: 50,
        height: 70,
      ),
    );
  }
}

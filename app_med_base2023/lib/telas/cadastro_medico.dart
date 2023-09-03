import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                  _centeredTextField(
                      controller: _emailController, label: 'Endereço de Email'),
                  _centeredTextField(
                      controller: _professionalTypeController,
                      label: 'Tipo Profissional'),
                  _centeredTextField(
                      controller: _hospitalController,
                      label: 'Hospital que trabalha'),
                  _centeredTextField(
                      controller: _crmController, label: 'Número CRM'),
                  _centeredTextField(
                      controller: _passwordController,
                      label: 'Senha',
                      isPassword: true),
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
                        onTap: () async {
                          if (_passwordController.text ==
                              _confirmPasswordController.text) {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );

                              String userId = userCredential.user!.uid;

                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userId)
                                  .set({
                                'full_name': _fullNameController.text,
                                'email': _emailController.text,
                                'professional_type':
                                    _professionalTypeController.text,
                                'hospital': _hospitalController.text,
                                'crm': _crmController.text,
                              });

                              print("Cadastro realizado com sucesso!");
                            } catch (e) {
                              print("Erro durante o cadastro: $e");
                            }
                          } else {
                            print("As senhas não coincidem.");
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
            color: Colors.blue.shade200,
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

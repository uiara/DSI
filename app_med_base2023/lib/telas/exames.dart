import 'package:flutter/material.dart';

void main() {
  runApp(MedicineApp());
}

class MedicineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PerfilMed(),
    );
  }
}

class Medicine {
  String name;
  bool isMain;
  bool isDeleted = false;

  Medicine({
    required this.name,
    this.isMain = false,
  });
}

class PerfilMed extends StatelessWidget {
  const PerfilMed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            GestureDetector(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Image.asset(
                      'images/Group 2.png',
                      width: 400,
                      height: 300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 90),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamesLaboratoriaisScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'images/exames.png',
                    width: 300,
                    height: 300,
                  ),
                  Text(
                    'EXAMES LABORATORIAIS',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamesLaboratoriaisScreen extends StatefulWidget {
  @override
  _ExamesLaboratoriaisScreenState createState() =>
      _ExamesLaboratoriaisScreenState();
}

class _ExamesLaboratoriaisScreenState extends State<ExamesLaboratoriaisScreen> {
  List<Medicine> existingExams = [
    'Hemograma',
    'Colesterol Total',
    'Glicemia em Jejum',
    'Hemoglobina Glicada (A1c)',
    'Creatinina',
    'Ureia',
    'Ácido Úrico',
    'TSH (Hormônio Estimulante da Tireoide)',
    'T4 Livre (Tiroxina Livre)',
    'T3 Livre (Triiodotironina Livre)',
    'Hemocultura',
    'Radiografia de Tórax',
    'Eletrocardiograma (ECG)',
    'Ultrassonografia',
    'Tomografia Computadorizada (TC)',
    'Ressonância Magnética (RM)',
    'Colonoscopia',
    'Endoscopia Digestiva Alta',
    'Teste de HIV',
    'Exame de Papanicolau (Pap)',
  ].map((examName) => Medicine(name: examName)).toList();

  List<Medicine> selectedExams = [];

  void editExam(Medicine exam) async {
    final editedExam = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditExamScreen(exam: exam),
      ),
    );

    if (editedExam != null) {
      setState(() {
        final index = existingExams.indexWhere((e) => e.name == exam.name);
        existingExams[index] = editedExam;
      });
    }
  }

  void deleteExam(Medicine exam) {
    setState(() {
      selectedExams.remove(exam);
    });
  }

  void saveSelectedExams() {
    print("Exames selecionados: ${selectedExams.map((exam) => exam.name).toList()}");
  }

  void viewSelectedExams() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExamesEscolhidosScreen(
          selectedExams: selectedExams,
          onDelete: (exam) {
            deleteExam(exam);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exames Laboratoriais'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: existingExams.length,
              itemBuilder: (context, index) {
                final exam = existingExams[index];
                return ListTile(
                  title: Text(exam.name),
                  trailing: Checkbox(
                    value: selectedExams.contains(exam),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            selectedExams.add(exam);
                          } else {
                            selectedExams.remove(exam);
                          }
                        }
                      });
                    },
                  ),
                  onLongPress: () {
                    setState(() {
                      if (selectedExams.contains(exam)) {
                        selectedExams.remove(exam);
                      } else {
                        selectedExams.add(exam);
                      }
                    });
                  },
                  tileColor: selectedExams.contains(exam)
                      ? Colors.blue.withOpacity(0.2)
                      : null,
                  onTap: () => editExam(exam),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: saveSelectedExams,
                child: Text('Salvar Exames Selecionados'),
              ),
              ElevatedButton(
                onPressed: viewSelectedExams,
                child: Text('Ver Exames Selecionados'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditExamScreen extends StatefulWidget {
  final Medicine exam;

  EditExamScreen({required this.exam});

  @override
  _EditExamScreenState createState() => _EditExamScreenState();
}

class _EditExamScreenState extends State<EditExamScreen> {
  TextEditingController newNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    newNameController.text = widget.exam.name;
  }

  void saveEditedExam() {
    final editedName = newNameController.text;
    final editedExam = Medicine(name: editedName);

    Navigator.pop(context, editedExam);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Exame'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: newNameController,
              decoration: InputDecoration(labelText: 'Novo Nome do Exame'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveEditedExam,
              child: Text('Salvar Edições'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamesEscolhidosScreen extends StatefulWidget {
  final List<Medicine> selectedExams;
  final Function(Medicine) onDelete;

  ExamesEscolhidosScreen({required this.selectedExams, required this.onDelete});

  @override
  _ExamesEscolhidosScreenState createState() =>
      _ExamesEscolhidosScreenState();
}

class _ExamesEscolhidosScreenState extends State<ExamesEscolhidosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exames Selecionados'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedExams.length,
        itemBuilder: (context, index) {
          final exam = widget.selectedExams[index];
          return ListTile(
            title: Text(exam.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final editedExam = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditExamScreen(exam: exam),
                      ),
                    );
                    if (editedExam != null) {
                      setState(() {
                        widget.onDelete(exam);
                        widget.selectedExams.remove(exam);
                        widget.selectedExams.add(editedExam);
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.onDelete(exam); // Chamada da função de exclusão
                    setState(() {
                      widget.selectedExams.remove(exam);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

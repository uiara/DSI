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
  final String name;
  final String dosage;
  bool isInjection = false;
  bool isDrops = false;
  bool isTablet = false;

  Medicine({
    required this.name,
    required this.dosage,
    this.isInjection = false,
    this.isDrops = false,
    this.isTablet = false,
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
                      'images/equipe-medica 3.png',
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
                    builder: (context) => MedicineList(),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'images/remedios.png',
                    width: 250,
                    height: 200,
                  ),
                  Text(
                    'MEDICAMENTOS',
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

class MedicineList extends StatefulWidget {
  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  final List<Medicine> medicines = [];
  final TextEditingController nameController = TextEditingController();
  String selectedDosage = '1 mg/ml'; // Valor padrão inicial
  int? editingIndex;
  bool isInjection = false;
  bool isDrops = false;
  bool isTablet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos Disponíveis'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            child: Image.asset(
              'images/remedios.png',
              width: 300,
              height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do Remédio'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedDosage,
              onChanged: (value) {
                setState(() {
                  selectedDosage = value!;
                });
              },
              items: [
                '1 mg/ml',
                '2 mg/ml',
                '3 mg/ml',
                '4 mg/ml',
                '5 mg/ml',
                // Adicione outras opções de dosagem conforme necessário
                for (var i = 10; i <= 1000; i += 10) '$i mg/ml',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('mg/ml'),
            ),
          ),
          CheckboxListTile(
            title: Text('Injeção'),
            value: isInjection,
            onChanged: (newValue) {
              setState(() {
                isInjection = newValue!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Gotas'),
            value: isDrops,
            onChanged: (newValue) {
              setState(() {
                isDrops = newValue!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Comprimido'),
            value: isTablet,
            onChanged: (newValue) {
              setState(() {
                isTablet = newValue!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (editingIndex != null) {
                  medicines[editingIndex!] = Medicine(
                    name: nameController.text,
                    dosage: selectedDosage,
                    isInjection: isInjection,
                    isDrops: isDrops,
                    isTablet: isTablet,
                  );
                  editingIndex = null;
                } else {
                  final medicine = Medicine(
                    name: nameController.text,
                    dosage: selectedDosage,
                    isInjection: isInjection,
                    isDrops: isDrops,
                    isTablet: isTablet,
                  );
                  medicines.add(medicine);
                }
                nameController.clear();
                selectedDosage = '1 mg/ml';
                isInjection = false;
                isDrops = false;
                isTablet = false;
              });
            },
            child: Text(editingIndex != null ? 'Salvar Edição' : 'Adicionar Medicamento'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                String medicineType = '';
                if (medicine.isInjection) {
                  medicineType = 'Injeção';
                }
                if (medicine.isDrops) {
                  medicineType = 'Gotas';
                }
                if (medicine.isTablet) {
                  medicineType = 'Comprimido';
                }
                return ListTile(
                  title: Text('${medicine.name} - ${medicine.dosage} - $medicineType'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            editingIndex = index;
                            nameController.text = medicine.name;
                            selectedDosage = medicine.dosage;
                            isInjection = medicine.isInjection;
                            isDrops = medicine.isDrops;
                            isTablet = medicine.isTablet;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            medicines.removeAt(index);
                            if (editingIndex == index) {
                              editingIndex = null;
                              nameController.clear();
                              selectedDosage = '1 mg/ml';
                              isInjection = false;
                              isDrops = false;
                              isTablet = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

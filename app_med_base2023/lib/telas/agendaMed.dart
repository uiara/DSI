import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaCadastro(),
  ));
}

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.white], 
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 300,
                height: 400,
                child: Padding(
                  padding: EdgeInsets.only(top: 80.0), 
                  child: Image.asset(
                    'images/equipe-medica 3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AgendaMedicoCRUD(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30.0), 
                              child: Image.asset(
                                'images/calendario.png',
                                width: 300, 
                                height: 200,
                                
                              ),
                            ),
                            Text(
                              'Criar Agenda de Atendimento',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class AgendaMedicoCRUD extends StatefulWidget {
  @override
  _AgendaMedicoCRUDState createState() => _AgendaMedicoCRUDState();
}

class _AgendaMedicoCRUDState extends State<AgendaMedicoCRUD> {
  List<String> appointments = [];
  TextEditingController appointmentController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int selectedIndex = -1;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('dd/MM/yyyy').format(date);
    }
    return 'Nenhuma data selecionada';
  }

  String _formatTime(TimeOfDay? time) {
    if (time != null) {
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
    return 'clique "Aqui" para selecionar o horário';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datas/Horários Disponíveis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60.0, 
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), 
                      child: TextButton(
                        onPressed: () => _selectDate(context),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue, 
                        ),
                        child: Text(
                          'Selecionar Data',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white, 
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    height: 60.0, 
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0), 
                        bottom: Radius.circular(10.0), 
                      ),
                      child: TextButton(
                        onPressed: () => _selectTime(context),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Selecionar Horário',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white, 
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: appointmentController,
              decoration: InputDecoration(
                hintText: 'Observações',
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 60.0, 
              child: TextButton(
                onPressed: () {
                  setState(() {
                    if (selectedIndex == -1) {
                      appointments.add(
                        'Data: ${_formatDate(selectedDate)} Horário: ${_formatTime(selectedTime)} - ${appointmentController.text}',
                      );
                    } else {
                      appointments[selectedIndex] =
                        'Data: ${_formatDate(selectedDate)} Horário: ${_formatTime(selectedTime)} - ${appointmentController.text}';
                      selectedIndex = -1;
                    }
                    appointmentController.clear();
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, 
                ),
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, 
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 60.0, 
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedAppointmentsScreen(appointments: appointments),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green, 
                ),
                child: Text(
                  'Consultas confirmadas',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, 
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(appointments[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              appointmentController.text =
                                appointments[index].substring(appointments[index].indexOf('-') + 2).trim();
                              selectedIndex = index;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              appointments.removeAt(index);
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
      ),
    );
  }
}

class SavedAppointmentsScreen extends StatelessWidget {
  final List<String> appointments;

  SavedAppointmentsScreen({required this.appointments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas Salvas'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(appointments[index]),
          );
        },
      ),
    );
  }
}

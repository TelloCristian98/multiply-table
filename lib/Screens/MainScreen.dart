import 'package:flutter/material.dart';
import 'package:multiply_tables/Screens/HomeScreen.dart';
import 'package:multiply_tables/Screens/PracticeScreen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final TextEditingController _tableNumberController = TextEditingController();
  int? _tableNumber;

  @override
  void initState() {
    super.initState();
    _tableNumberController.addListener(_updateTableNumber);
  }

  @override
  void dispose() {
    _tableNumberController.removeListener(_updateTableNumber);
    _tableNumberController.dispose();
    super.dispose();
  }

  void _updateTableNumber() {
    setState(() {
      _tableNumber = int.tryParse(_tableNumberController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MULTIPLICATION TABLES"),
        backgroundColor: Color.fromARGB(255, 181, 164, 237),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'CustomFont', 
          fontSize: 20, 
          fontWeight: FontWeight.bold,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Tablas de multiplicar

            //Integrantes
            SizedBox(height: 20),

            Center(
              child: Container(
                width: 500, // Ancho específico del Container
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 201, 186, 250),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Developer by:\nMateo Barriga, Camila Morales, Cristian Tello',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 50),

            Center(
              child: Container(
                width: 300, // Ancho específico del botón
                child: ElevatedButton(onPressed: (){
                //Conexion de pantallas :D
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> const HomeScreen(),),);
              },child: const Text("Multiplication Tables"),
         ),
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: Container(
                width: 300, // Ancho específico del campo de texto
                child: TextField(
                  controller: _tableNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter the table number',
                    labelStyle: TextStyle(
                      fontSize: 18, 
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 181, 164, 237)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 300, // Ancho específico del botón
                child: ElevatedButton(
                  onPressed: () {
                    if (_tableNumber != null) {
                      // Conexión de pantallas
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PracticeScreen(tableNumber: _tableNumber!),
                        ),
                      );
                    } else {
                      // Validación de número válido
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a valid number')),
                      );
                    }
                  },
                  child: Text(_tableNumber != null
                      ? "Go practice the table $_tableNumber"
                      : "Go practice the table"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multiply_tables/Screens/tableScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  void _navigateToTableScreen(BuildContext context) {
    final int? number = int.tryParse(_controller.text);
    if (number != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => tableScreen(number: number),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiplication Table"),
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
          children: [

            Center(
              child:Container(
              width: 500, // Ancho específico del TextField
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter a number",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 181, 164, 237),
                    ),
                  ),
                  // Centrar el texto del label
                  alignLabelWithHint: true,
                ),
              ),
            ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _navigateToTableScreen(context),
              child: const Text("View table"),
            ),
          ],
        ),
      ),
    );
  }
}

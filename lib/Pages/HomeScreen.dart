import "package:flutter/material.dart";
import 'package:multiply_tables/Pages/tableScreen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  
  @override
  HomeScreenState createState()=> HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  final TextEditingController controller=TextEditingController();

  void navigateToTableScreen(BuildContext context){
    final int? number =int.tryParse(controller.text);
    if(number != null){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => tableScreen(number: number),
        ),
      );
    }
  }
   @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiplication Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter a number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => navigateToTableScreen(context),
            child: const Text("View table"),
            ),
          ],
        )
      ),
    );
  }
}
 
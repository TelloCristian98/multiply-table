import 'package:flutter/material.dart';

class tableScreen extends StatelessWidget{
 final int number; 
 const tableScreen({required this.number, super.key});
 
  @override
  Widget build(BuildContext context){
    List<String> results=List.generate(10, (i) => "${number}x${i + 1}=${number *(i+1)}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabla de $number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(itemCount: results.length,
        itemBuilder:(context, index) {
          return ListTile(
            title: Text(results[index]),
          );
        }
        ),
      ),
    );
  }

  
}
